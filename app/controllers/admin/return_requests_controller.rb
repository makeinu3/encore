class Admin::ReturnRequestsController < ApplicationController
  
  def update
    return_request = ReturnRequest.find(params[:id])
    return_request.update(approved: true)
    return_request.customer.update(is_deleted: false)
    redirect_to  admin_top_path
  end
end
