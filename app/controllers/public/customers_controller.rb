class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
   @customer = current_customer
   @comments = current_customer.comments.page(params[:page]).per(3)
  end

  def edit
   @customer = current_customer
  end

  def update
   @customer = current_customer
   if @customer.update(customer_params)
    redirect_to customers_mypage_path(current_customer)
   else
     flash[:danger] = 'マイページの編集に失敗しました'
     render :edit
   end
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
    params.require(:customer).permit(:name, :name_kana, :nickname, :postal_code, :address, :telephone_number, :email)
  end
end
