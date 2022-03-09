class Admin::CommentsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @comments = @item.comments
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @item = @comment.item
    @comment.destroy
    redirect_to admin_item_comments_path(@item)
  end

  def update
    comment = Comment.find(params[:id])
    item = comment.item
    comment.update(comment_params)
    redirect_to admin_item_comments_path(item)
  end

  private
  def comment_params
    params.require(:comment).permit(:item_id, :comment_content, :rate)
  end
end
