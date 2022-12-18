class ApplicationController < ActionController::Base

  private

  ## admin
  # サイドバー用
  def set_sidebar
    @customers = Customer.all
    @posts = Post.all.order("created_at DESC")
    @messages = Message.all
    @return_requests = ReturnRequest.where(approved: false)
  end

  ## public
  # サインインしてない場合、welcomeページにリダイレクト
  def redirect_welcome
    redirect_to welcome_path unless customer_signed_in?
  end

  # 退会済会員が復活申請中の場合
  def return_requested
    if customer_signed_in? && current_customer.is_deleted
      redirect_to complete_path
    end
  end

  ## admin,public 共通
  # customerのid取得
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # postのid取得
  def set_post
    @post = Post.find(params[:id])
  end

  # messageのid取得
  def set_message
    @message = Message.find(params[:id])
  end

  # genreのid取得
  def set_genre
    @genre = Genre.find(params[:id])
  end

end
