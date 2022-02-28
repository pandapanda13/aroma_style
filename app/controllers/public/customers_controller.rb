class Public::CustomersController < ApplicationController
  def show
   @customer = current_customer
  end

  def edit
   @customer = current_customer
  end

  def update
   customer = current_customer
   customer.update(customer_params)
   redirect_to customers_mypage_path(current_customer)
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理が完了いたしました"
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
