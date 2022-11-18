class Admin::MessagesController < ApplicationController

  before_action :authenticate_admin!
  before_action :set_sidebar                    # @customers, @posts, @messages
  before_action :set_message, except: [:index]  # Message.find(params[:id])

  def index
    @messages = Message.all.includes(:customer).page(params[:page]).per(10)
    @message = Message.new
  end

  def destroy
    @message.destroy
  end


  private

  def message_params
    params.require(:message).permit(:message)
  end

end
