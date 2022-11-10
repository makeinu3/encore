class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
    @posts = Post.all.order("created_at DESC")
    @messages = Message.all
  end

  def show
    @customer = Customer.find(params[:id])
    # サイドバー用
    @customers = Customer.all
    @posts = Post.all.order("created_at DESC")
    @messages = Message.all
  end

  def edit
  end

  def update
  end

end
