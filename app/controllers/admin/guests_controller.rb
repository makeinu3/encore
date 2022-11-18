class Admin::GuestsController < ApplicationController

  def admin_guest
    admin = Admin.find_or_create_by!(email: 'guest@admin.com') do |admin|
      admin.password = SecureRandom.urlsafe_base64
    end
    sign_in admin
    redirect_to admin_top_path, notice: '管理者(ゲスト)としてログインしました。'
  end

end
