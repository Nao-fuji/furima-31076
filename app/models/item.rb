class Item < ApplicationRecord
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id, :status_id, :shipping_date_id, :shipping_address_id, :delivery_charge_id
  end
  validates :name, :price, :explain, :image, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'の範囲は¥300~¥9,999,999の間で設定してください' }

  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipping_address
  belongs_to_active_hash :shipping_date
end
