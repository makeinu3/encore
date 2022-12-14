class Public::CustomersController < ApplicationController

  before_action :redirect_welcome
  before_action :return_requested, except: [:confirm, :complete]
  before_action :set_customer, only: [:show, :edit, :update, :likes]  # Customer.find(params[:id])
  before_action :ensure_guest_user, except: [:show, :likes, :confirm, :complete]

  def show
    @customer_posts = Post.where(customer_id: @customer).order(show_date: "DESC", created_at: "DESC")
  end

  def edit
  end

  def update
    @customer_posts = Post.where(customer_id: @customer).order(show_date: "DESC", created_at: "DESC")
    if @customer.update(customer_params)
      render :show
    else
      render :edit
    end
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
    @customer.update(cancel_params)
    reset_session
    flash[:notice] = "退会手続きが完了しました。"
    redirect_to thanks_path
  end

  # 退会済アカウントの復活確認
  def confirm
  end

  # 復活申請完了画面
  def complete
    flash[:notice] = "復活申請が完了しました。"
  end


  private

  def customer_params
    params.require(:customer).permit(:name, :my_fave, :introduction, :email, :published)
  end

  def cancel_params
    params.require(:customer).permit(:is_deleted, :cancel, :published)
  end

  # ゲストログイン
  def ensure_guest_user
    if current_customer.name == "guestuser"
      redirect_to customer_path(current_customer) , notice: 'ゲストユーザーはこの操作を実行できません。'
    end
  end

end
