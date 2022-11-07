class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    render :show
  end



  private

  def customer_params
    params.require(:customer).permit(:name, :my_fave, :introduction, :email)
  end

end
