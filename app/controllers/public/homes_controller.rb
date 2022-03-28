class Public::HomesController < ApplicationController
  def top
    @items = Item.order(created_at: :desc).limit(3)
    # binding.pry
    @item_comment_ranks = Item.item_comment_ranks(3)
    @today = Time.now.month
  end

  def about
  end

  def policy
  end
end
