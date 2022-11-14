class Public::MessagesController < ApplicationController

  before_action :redirect_welcome
  before_action :set_message, only: [:destroy]  # Message.find(params[:id])

  def index
    @messages = Message.all.includes(:customer)
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.customer_id = current_customer.id
    @message.save
    redirect_to messages_path
  end

  def destroy
    @message.destroy
    redirect_to messages_path
  end


  private

  def message_params
    params.require(:message).permit(:message)
  end

end
