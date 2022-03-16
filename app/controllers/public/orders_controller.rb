class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def create
    cart_items = current_customer.cart_items
    @order = Order.new (order_params)
    @order.bill = params[:order][:bill]
    @order.customer_id = current_customer.id
    @order.shipping_fee = 500
    if @order.save
     cart_items.each do |cart_item|
       @order_detail = OrderDetail.new
       @order_detail.item_id = cart_item.item_id
       @order_detail.order_id = @order.id
       @order_detail.amount = cart_item.amount
       @order_detail.selected = cart_item.selected
       @order_detail.price = cart_item.item.price
       @order_detail.save
     end
     redirect_to orders_thanks_path
     cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def thanks
  end

  def index
    @orders = current_customer.orders.all.order(created_at: :desc).page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.customer == current_customer
     render :show
    else
     redirect_to orders_path(current_customer)
    end
  end

  def confirm
    params[:order][:payment] = params[:order][:payment].to_i
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    if params[:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.name
    elsif params[:select_address] == "1"
      render :new,{order:@order} and return unless @order.valid?
    end
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment, :bill, :total)
  end

end
