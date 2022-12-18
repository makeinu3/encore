class Public::RelationshipsController < ApplicationController

  before_action :redirect_welcome
  before_action :return_requested

  def create
    current_customer.follow(params[:customer_id])
    redirect_to request.referer
  end

  def destroy
    current_customer.unfollow(params[:customer_id])
    redirect_to request.referer
  end

  # フォロー一覧
  def followings
    @customers = Customer.find(params[:customer_id]).followings
  end

  # フォロワー一覧
  def followers
    @customers = Customer.find(params[:customer_id]).followers
  end

end
