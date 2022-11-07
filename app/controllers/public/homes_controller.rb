class Public::HomesController < ApplicationController

  before_action :authenticate_customer!, only: [:top]

  def welcome  # ゲストログイン、ログイン、サインアップ選択画面
  end

  def top
  end

  def about
  end
  
  def thanks  # ログアウト後の画面
  end

end
