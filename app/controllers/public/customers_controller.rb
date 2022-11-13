class Public::CustomersController < ApplicationController

  before_action :redirect_welcome
  before_action :set_customer, only: [:show, :likes]  # Customer.find(params[:id])

  def my_page
    @customer = current_customer
  end

  def show
    @customer_posts = Post.where(customer_id: @customer).order("created_at DESC")
    # ジャンルごとの投稿数
    @genre1_posts = Post.where(genre_id: 1, customer_id: @customer)
    @genre2_posts = Post.where(genre_id: 2, customer_id: @customer)
    @genre3_posts = Post.where(genre_id: 3, customer_id: @customer)
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    render :my_page
  end

  # いいねした投稿一覧
  def likes
    likes = Like.where(customer_id: @customer.id).pluck(:post_id)
    @like_posts = Post.find(likes)
  end

  # 退会確認
  def unsubscribe
    @customer = current_customer
  end

  # 退会処理
  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会手続きが完了しました。"
    redirect_to thanks_path
  end


  private

  def customer_params
    params.require(:customer).permit(:name, :my_fave, :introduction, :email)
  end

end
