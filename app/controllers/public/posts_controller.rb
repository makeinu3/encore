class Public::PostsController < ApplicationController

  before_action :redirect_welcome, except: [:index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]  # Post.find(params[:id])

  def index
    @search = Post.publish_posts.includes(:customer).ransack(params[:q])         # 検索
    @posts = @search.result.page(params[:page]).per(8).order("created_at DESC")  # 検索結果
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to post_path(@post)
    else
      flash[:notice] = "投稿に失敗しました。"
      render :new
    end
  end

  def edit
  end

  def update
    @comment = Comment.new
    @post.update(post_params)
    render :show
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:genre_id, :title, :body, :image, :place, :show_name, :show_date)
  end

end
