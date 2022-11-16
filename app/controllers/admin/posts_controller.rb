class Admin::PostsController < ApplicationController

  before_action :authenticate_admin!
  before_action :set_sidebar                 # @customers, @posts, @messages
  before_action :set_post, except: [:index]  # Post.find(params[:id])

  def index
    @search = Post.ransack(params[:q])                                               # 検索
    @all_posts = @search.result.page(params[:page]).per(8).order("created_at DESC")  # 検索結果
  end

  def show
    @comment = Comment.new
  end

end
