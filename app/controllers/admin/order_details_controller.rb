class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)
     if @order_details.count == @order_details.where(status: 2).count
       @order.update(shipping_status: 2)
     end
    redirect_to admin_order_path(@order.id)
  end

  private
  def order_detail_params
   params.require(:order_detail).permit(:status, :item_id, :order_id, :price, :amount)
  end
end
