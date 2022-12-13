class Public::CommentsController < ApplicationController

  before_action :redirect_welcome


  def create
    @post = Post.find(params[:post_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.score = Language.get_data(comment_params[:comment])
    @comment.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
  end


  private

  def comment_params
    params.require(:comment).permit(:comment)
  end



  # def
  #   if current_customer && current_customer.is_deleted
  #     redirect_to confirm_path

  #   end
  # end

end
