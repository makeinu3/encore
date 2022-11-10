class Admin::HomesController < ApplicationController

  def top
    @customers = Customer.all
    @posts = Post.all.order("created_at DESC")
    @messages = Message.all
  end

end
