class Public::HomesController < ApplicationController
 
  def top
    @items = Item.order(created_at: :desc). limit(3)
    @item_comment_ranks = Item.find(Comment.group(:item_id).order('count(item_id) desc').pluck(:item_id))
  end 
  def about
  end
  
end
