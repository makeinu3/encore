class Public::PostsController < ApplicationController

  before_action :redirect_welcome, except: [:index]
  before_action :return_requested, except: [:index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]  # Post.find(params[:id])

  def index
    @search = Post.publish_posts.includes(:customer).ransack(params[:q])          # 検索
    if params[:place]
      @posts = Post.where(place:params[:place]).page(params[:page]).per(6).order(created_at: "DESC")
    else
      @posts = @search.result.page(params[:page]).per(6).order(created_at: "DESC")  # 検索結果
    end
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
    unless @post.customer == current_customer
      flash[:notice] = "その操作はできません。"
      redirect_to post_path(@post)
    end
  end

  def update
    @comment = Comment.new
    if @post.customer == current_customer
      @post.update(post_params)
      flash[:notice] = "更新に成功しました。"
    else
      flash[:notice] = "更新に失敗しました。"
    end
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
