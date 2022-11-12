class Admin::MessagesController < ApplicationController

  before_action :authenticate_admin!
  before_action :set_sidebar                 # @customers, @posts, @messages
  before_action :set_post, except: [:index]  # Message.find(params[:id])

  def index
    @messages = Message.all
    @message = Message.new
  end

  def destroy
    @message.destroy
    redirect_to admin_messages_path
  end


  private

  def message_params
    params.require(:message).permit(:message)
  end

end
