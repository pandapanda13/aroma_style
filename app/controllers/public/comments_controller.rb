class Public::CommentsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @comments = @item.comments
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def new
    @item = Item.find(params[:item_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    # @item = Item.find(params[:item_id])
    @comment.item_id = params[:item_id]
    if @comment.save
     redirect_to item_comments_path(@comment.item)
    else
      #@item = Item.find(params[:id])
      render new_item_comment_path
    end
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    redirect_to customers_mypage_path(current_customer)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to customers_mypage_path(current_customer)
  end

  private
  def comment_params
    params.require(:comment).permit(:item_id, :comment_content, :rate).merge(customer_id: current_customer.id)
  end
end
