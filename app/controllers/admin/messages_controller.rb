class Admin::MessagesController < ApplicationController

  def index
    @messages = Message.all
    @message = Message.new
    # サイドバー用
    @customers = Customer.all
    @posts = Post.all.order("created_at DESC")
    @messages = Message.all
  end

  def destroy
    Message.find(params[:id]).destroy
    redirect_to admin_messages_path
    # サイドバー用
    @customers = Customer.all
    @posts = Post.all.order("created_at DESC")
    @messages = Message.all
  end


  private

  def message_params
    params.require(:message).permit(:message)
  end

end
