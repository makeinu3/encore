class Admin::CustomersController < ApplicationController

  before_action :authenticate_admin!
  before_action :set_sidebar, except: [:index]   # @customers, @posts, @messages
  before_action :set_customer, except: [:index]  # Customer.find(params[:id])

  def index
    @search = Customer.ransack(params[:q])                  # 検索
    @customers = @search.result.page(params[:page]).per(5)  # 検索結果
    # サイドバー用
    @posts = Post.all.order("created_at DESC")
    @messages = Message.all
  end

  def show
  end

  def edit
  end

  def update
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer)
  end


  private

  def customer_params
    params.require(:customer).permit(:published, :is_deleted)
  end

end
