class Item < ApplicationRecord
  validates :name, :price, :category, :status, :explain, :shipping_address, :shipping_date, :delivery_charge, :image, presence: true
  validates :category_id, :status_id, :shipping_date_id, :shipping_address_id, :delivery_charge_id, numericality: { other_than: 1 }

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '価格の範囲は¥300~¥9,999,999の間で設定してください' }

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipping_address
  belongs_to_active_hash :shipping_date
end
