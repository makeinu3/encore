class Public::MessagesController < ApplicationController

  before_action :redirect_welcome
  before_action :set_message, only: [:destroy]  # Message.find(params[:id])
  before_action :set_message_all

  def index
    @message = Message.new
    # 会場ごとに投稿をグループにする
    @place_posts = Post.group(:place)
  end

  def create
    @message = Message.new(message_params)
    @message.customer_id = current_customer.id
    @message.save
  end

  def destroy
    @message.destroy
  end


  private

  def message_params
    params.require(:message).permit(:message)
  end

  def set_message_all
    @messages = Message.all.includes(:customer)
  end

end
