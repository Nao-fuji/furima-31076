class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path if current_user.id != @item.user_id || @item.purchase.present?
  end

  def update
    if @item.update(item_params) 
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if current_user.id == @item.user_id && @item.purchase.blank?
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :category_id, :status_id, :explain, :shipping_address_id, :shipping_date_id, :delivery_charge_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
