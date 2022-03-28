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

  def self.item_comment_ranks(limit)
    self.find(Comment.group(:item_id).order("rate DESC").pluck(:item_id)).first(limit)
  end

end
