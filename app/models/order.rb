class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  
  enum payment: { credit_card: 0, transfer: 1 }
  
  def shipping_fee
    500.to_s
  end
  
  def add_tax_price
  (self.price * 1.10).floor
  end
end
