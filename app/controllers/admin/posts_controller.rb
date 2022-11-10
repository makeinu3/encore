class Admin::PostsController < ApplicationController

  def index
    @search = Post.ransack(params[:q])               # 検索
    @posts = @search.result.order("created_at DESC")  # 検索結果
    # サイドバー用
    @customers = Customer.all
    # @posts = Post.all.order("created_at DESC")
    @messages = Message.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    # サイドバー用
    @customers = Customer.all
    @posts = Post.all.order("created_at DESC")
    @messages = Message.all
  end

end
