class Like < ApplicationRecord

  belongs_to :customer
  belongs_to :post

  validates_uniqueness_of :post_id, scope: :customer_id

  # 過去一週間のいいね数ランキング(トップページのおすすめ欄に表示)
  def self.last_week
    to = Time.current.at_end_of_day
    from = (to - 6.day).at_beginning_of_day
    Post.publish_posts.includes(:liked_customers).limit(3).
      sort { |a,b|
        b.liked_customers.where(likes: { created_at: from...to }).size <=>
        a.liked_customers.where(likes: { created_at: from...to }).size
      }
  end

end
