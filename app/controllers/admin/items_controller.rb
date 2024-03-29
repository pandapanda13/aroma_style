class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items = Item.page(params[:page]).per(10)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
     redirect_to admin_item_path(@item.id)
    else
     render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @comments = @item.comments
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  private
  def item_params
    params.require(:item).permit(:image_id, :name, :volume, :price, :introduction, :blend_example, :blend_flag)
  end
end
