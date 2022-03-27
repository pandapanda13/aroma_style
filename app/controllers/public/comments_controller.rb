class Public::CommentsController < ApplicationController
  before_action :authenticate_customer!, except: [:index]

  def index
    @item = Item.find(params[:item_id])
    @comments = @item.comments
  end

  def edit
    @comment = Comment.find(params[:id])
     if @comment.customer == current_customer
       render "edit"
     else
       redirect_to customers_mypage_path(current_customer)
     end
  end

  def new
    #@orders = current_customer.orders
    @item = Item.find(params[:item_id])
    @comment = Comment.new
    #if @orders.order_details.item_id.include?(comment.item_id)
      #redirect_to item_comments_path
    #end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.item_id = params[:item_id]
    if @comment.save
     redirect_to item_comments_path(@comment.item)
    else

      @item = Item.find(params[:item_id])
      flash[:danger] = 'コメントの投稿に失敗しました'
      render :new
    end
  end

  def update
    comment = Comment.find(params[:id])
    if comment.customer == current_customer
      comment.update(comment_params)
       redirect_to customers_mypage_path(current_customer)
     else
       redirect_to customers_mypage_path(current_customer)
     end

  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.customer == current_customer
      @comment.destroy
      redirect_to customers_mypage_path(current_customer)
    else
      redirect_to customers_mypage_path(current_customer)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:item_id, :comment_content, :rate).merge(customer_id: current_customer.id)
  end
end
