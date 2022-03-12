class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:show, :index, :search]
  before_action :search_item, only: [:index, :search]


  def index
    @items = Item.all
   
  end

  def search
    @results = @a.result(distinct: true).order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.all
    @cart_item = CartItem.new
    @comments = @item.comments
  end

  private
  def item_params
   params.require(:item).permit(:name,:introduction, :image_id, :price, :blend_flag, :rate, :comment_content)
  end
  
  def search_item
    @a = Item.ransack(params[:q])
  end
end
