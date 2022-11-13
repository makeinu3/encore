class Admin::HomesController < ApplicationController

  before_action :set_sidebar  # @customers, @posts, @messages

  def top
    @new_posts = Post.limit(4).order("created_at DESC")
  end

end
