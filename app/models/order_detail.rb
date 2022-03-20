class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum status: { unstarted: 0, preparing: 1, completed: 2, shipped: 3}

  def add_tax_price
  (self.price * 1.10).floor
  end
end
