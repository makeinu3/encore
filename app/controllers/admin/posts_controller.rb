class Admin::PostsController < ApplicationController

  before_action :authenticate_admin!
  before_action :set_sidebar, except: [:index]  # @customers, @posts, @messages
  before_action :set_post, except: [:index]     # Post.find(params[:id])

  def index
    @search = Post.ransack(params[:q])                # 検索
    @posts = @search.result.order("created_at DESC")  # 検索結果
    # サイドバー用
    @customers = Customer.all
    @messages = Message.all
  end

  def show
    @comment = Comment.new
  end

end
