class Public::HomesController < ApplicationController

  def welcome  # ゲストログイン、ログイン、サインアップ選択画面
  end

  def top
    @posts = Post.limit(9).order("created_at DESC")
  end

  def about
  end

  def thanks  # ログアウト後
  end

end
