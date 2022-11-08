class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy     # 投稿
  has_many :comments, dependent: :destroy  # 投稿へのコメント
  has_many :likes, dependent: :destroy     # 投稿へのいいね

  # フォローした
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  # フォローされた
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # フォローしたとき
  def follow(customer_id)
    relationships.create(followed_id: customer_id)
  end
  # フォロー外した時
  def unfollow(customer_id)
    relationships.find_by(followed_id: customer_id).destroy
  end
  # フォローしているかどうか
  def following?(customer)
    followings.include?(customer)
  end

end
