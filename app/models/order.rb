class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

  enum payment: { credit_card: 0, transfer: 1 }
  enum shipping_status: { waiting: 0, paid: 1, shipped: 2 }

  def shipping_fee
    500.to_s
  end

  def add_tax_price
  (self.price * 1.10).floor
  end
end
