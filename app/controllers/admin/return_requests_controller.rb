class Admin::ReturnRequestsController < ApplicationController

  before_action :authenticate_admin!
  before_action :set_sidebar  # @customers, @posts, @messages, @return_requests

  def index
  end

  def update
    return_request = ReturnRequest.find(params[:id])
    return_request.update(approved: true)
    return_request.customer.update(is_deleted: false)
    redirect_to  admin_top_path
  end
end
