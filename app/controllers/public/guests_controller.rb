class Public::GuestsController < ApplicationController

  def new_guest
    customer = Customer.find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "guestuser"
    end
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end
