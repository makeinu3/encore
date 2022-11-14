class Public::HomesController < ApplicationController

  def welcome  # ゲストログイン、ログイン、サインアップ選択画面
  end

  def top
    # ジャンルごとの投稿(仮)
    @genre1_posts = Post.where(genre_id: 1).limit(3).order("created_at DESC")
    @genre2_posts = Post.where(genre_id: 2).limit(3).order("created_at DESC")
    @genre3_posts = Post.where(genre_id: 3).limit(3).order("created_at DESC")
  end

  def about
  end

  def thanks  # ログアウト後
  end

end
