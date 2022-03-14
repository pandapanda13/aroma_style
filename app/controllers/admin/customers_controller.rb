class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page]).per(3)
  end

  def show
    @customer = Customer.find(params[:id])
    @comments = @customer.comments.page(params[:page]).per(3)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end

  private
  def customer_params
    params.require(:customer).permit(:name, :name_kana, :nickname, :postal_code, :address, :email, :telephone_number, :is_active)
  end
end
