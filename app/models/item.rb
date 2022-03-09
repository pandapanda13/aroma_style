class Item < ApplicationRecord
  has_one_attached :image_id
  has_many :cart_items
  has_many :order_details
  has_many :comments, dependent: :destroy

  def add_tax_price
  (self.price * 1.10).floor
  end

   def avg_score
    unless self.comments.empty?
      comments.average(:rate).round(1)
    else
      0.0
    end
   end

end
