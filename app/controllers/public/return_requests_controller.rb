class Public::ReturnRequestsController < ApplicationController
  
  
  def create
    current_customer.return_requests.create!(approved: false)
    redirect_to complete_path
  end
  
  
end
