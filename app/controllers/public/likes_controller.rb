class Public::LikesController < ApplicationController

  before_action :redirect_welcome

  def create
    post = Post.find(params[:post_id])
    like = current_customer.likes.new(post_id: post.id)
    like.save
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    like = current_customer.likes.find_by(post_id: post.id)
    like.destroy
    redirect_to post_path(post)
  end

end
