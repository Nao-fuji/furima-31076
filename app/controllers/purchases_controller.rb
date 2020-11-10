class PurchasesController < ApplicationController
  before_action :set_item, only:[:index, :create]
  before_action :user_choice, only: :index
  before_action :authenticate_user!,only:[:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_address_params
    params.require(:purchase_address).permit(:postal_code, :prefectures_id, :cities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price, 
      card: purchase_address_params[:token],
      currency: 'jpy'
    )
  end

  def user_choice
    if current_user == @item.user || @item.purchase.present?
      redirect_to root_path
    end
  end
end
