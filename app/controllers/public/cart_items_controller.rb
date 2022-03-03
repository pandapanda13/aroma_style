class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def empty
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    cart_item = CartItem.new(cart_item_params)
    item = Item.find(params[:cart_item][:item_id])

    if item.name == '2種ブレンド'
      if params[:cart_item][:selected] != nil && (params[:cart_item][:selected].size == 2)
        cart_item.selected = params[:cart_item][:selected].join('・')
      else
        @item = item
        @items = Item.all
        @cart_item = cart_item
        @cart_item.errors.add(:base, "２つ選択してください")
        render template: "public/items/show"
        return
      end
    elsif item.name == '3種ブレンド'
      if params[:cart_item][:selected] != nil && (params[:cart_item][:selected].size == 3)
        cart_item.selected = params[:cart_item][:selected].join('・')
      else
        @item = item
        @items = Item.all
        @cart_item = cart_item
        @cart_item.errors.add(:base, "3つ選択してください")
        render template: "public/items/show"
        return
      end
    end

    cart_item.customer_id = current_customer.id
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id], selected: params[:cart_item][:selected].join("・")).present?
      # すでに同じ種類、同じ選択された商品がカートに入っている
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id], selected: params[:cart_item][:selected].join("・"))
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to cart_items_path
#    else
#    end
#    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?

#        cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
#        cart_item.amount += params[:cart_item][:amount].to_i
#        cart_item.save
#      redirect_to cart_items_path


      # ないので新しく追加する。
    elsif cart_item.save
      redirect_to cart_items_path
    else
      render cart_items_path
    end
  end

  private
  def cart_item_params
   params.require(:cart_item).permit(:amount, :selected, :item_id, :customer_id)
  end
end
