# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

  #before_action :customer_state, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end


  protected

  def after_sign_in_path_for(resource)
    flash[:notice] = "おかえりなさいませ。"
    if resource.is_deleted
      confirm_path
    else
      customer_path(resource)
    end
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "お気をつけて、いってらっしゃいませ。"
    thanks_path
  end

  # 退会ステータスを確認
  #def customer_state
    # 入力されたemailからアカウントを1件取得
   # @customer = Customer.find_by(email: params[:customer][:email])
    # アカウントを取得できなかった場合、このメソッドを終了する
    #return if !@customer
    # 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別 && 退会ステータスがtrue
    # if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true)
    #   # 退会済カスタマーは復活確認画面へ
    #   flash[:notice] = "このメールアドレスは現在ご利用できません。"
    #   redirect_to confirm_path
    # end
  #end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
