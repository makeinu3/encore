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

  # いいねした投稿一覧
  def likes
    @customer = Customer.find(params[:id])
    likes = Like.where(customer_id: @customer.id).pluck(:post_id)
    @like_posts = Post.find(likes)
  end


  private

  def customer_params
    params.require(:customer).permit(:name, :my_fave, :introduction, :email)
  end

end
