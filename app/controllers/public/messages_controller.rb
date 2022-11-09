class Public::MessagesController < ApplicationController

  def index
    @messages = Message.all.includes(:customer).order("created_at DESC")
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.customer_id = current_customer.id
    @message.save
    redirect_to messages_path
  end

  def destroy
    Message.find(params[:id]).destroy
    redirect_to messages_path
  end


  private

  def message_params
    params.require(:message).permit(:message)
  end

end
