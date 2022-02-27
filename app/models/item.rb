class Item < ApplicationRecord
  has_one_attached :image_id
  has_many :cart_items
  has_many :order_details
  has_many :comments

  def add_tax_price
  (self.price * 1.10).floor
  end
end
