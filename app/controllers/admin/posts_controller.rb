class Admin::PostsController < ApplicationController

  def index
    @search = Post.ransack(params[:q])  # 検索
    @posts = @search.result             # 検索結果
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

end
