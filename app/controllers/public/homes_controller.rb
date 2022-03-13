class Public::HomesController < ApplicationController
  def top
    @items = Item.order(created_at: :desc).limit(3)
    @item_comment_ranks = Item.find(Comment.group(:item_id).order("rate DESC").pluck(:item_id)).first(3)
  end
  
  def about
  end
end
