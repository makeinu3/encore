class Public::PostsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @search = Post.ransack(params[:q])  # 検索
    @posts = @search.result             # 検索結果
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      redirect_to post_path(@post)
    else
      render posts_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @comment = Comment.new
    @post.update(post_params)
    render :show
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:genre_id, :title, :body, :image, :place, :show_name, :show_date)
  end

end
