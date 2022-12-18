class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!
  before_action :set_sidebar  # @customers, @posts, @messages, @return_requests

  def top
    @new_customers = Customer.limit(3).order(created_at: "DESC")
    @new_posts = Post.limit(3).order(created_at: "DESC")
  end

end
