class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :cities, :address, :building_name, :phone_number,:user_id,:item_id, :token
  
  validates :prefectures_id,numericality: { other_than: 1 }
  with_options presence: true do
    validates :postal_code, format:{with:/\A\d{3}[-]\d{4}\z/, message:'ハイフンを使用してください'}
    validates :phone_number, length:{maximum: 11},format: {with:/\A[0-9]+\z/, message:'ハイフンは必要ありません'}
    validates :cities,:address,:token,:user_id,:item_id
  end

  def save
    purchase = Purchase.create(user_id: user_id,item_id: item_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, cities: cities, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end

end
