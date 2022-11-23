class Public::HomesController < ApplicationController

  def welcome  # ゲストログイン、ログイン、サインアップ選択画面
  end

  def top
    # 本日のおすすめ(過去1週間のいいねランキング)
    @likes_rank = Like.last_week
    # タイムライン(フォローしている人の投稿)
    if customer_signed_in?
      @time_line = Post.publish_posts.where(customer_id: [current_customer]).order(created_at: "DESC")
    end
  end

  def about
  end

  def thanks  # ログアウト後
  end

end
