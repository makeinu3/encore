class Admin::CustomersController < ApplicationController

  def index
    @search = Customer.ransack(params[:q])  # 検索
    @customers = @search.result             # 検索結果
    @posts = Post.all.order("created_at DESC")
    @messages = Message.all
  end

  def show
    @customer = Customer.find(params[:id])
    # サイドバー用
    @customers = Customer.all
    @posts = Post.all.order("created_at DESC")
    @messages = Message.all
  end

  def edit
    @customer = Customer.find(params[:id])
    # サイドバー用
    @customers = Customer.all
    @posts = Post.all.order("created_at DESC")
    @messages = Message.all
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer)
    # サイドバー用
    @customers = Customer.all
    @posts = Post.all.order("created_at DESC")
    @messages = Message.all
  end


  private

  def customer_params
    params.require(:customer).permit(:published, :is_deleted)
  end

end
