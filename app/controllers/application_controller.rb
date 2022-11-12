class ApplicationController < ActionController::Base

  private

  ## admin
  # サイドバー用
  def set_sidebar
    @customers = Customer.all
    @posts = Post.all.order("created_at DESC")
    @messages = Message.all
  end

  ## public
  # サインインしてない場合、welcomeページにリダイレクト
  def redirect_welcome
    redirect_to welcome_path unless customer_signed_in?
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
