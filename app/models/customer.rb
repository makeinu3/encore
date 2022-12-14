class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy     # 投稿
  has_many :comments, dependent: :destroy  # 投稿へのコメント
  has_many :likes, dependent: :destroy     # 投稿へのいいね
  has_many :messages, dependent: :destroy  # お客様ノート(掲示板)へのメッセージ

  # フォローした
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  # フォローされた
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # 復活申請
  has_many :return_requests, dependent: :destroy


  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :my_fave, length: { maximum: 20 }
  validates :introduction, length: { maximum: 300 }
  validates :cancel, length: { maximum: 300 }

  # 公開/非公開
  scope :publish, -> { where(published: true) }
  scope :unpublish, -> { where(published: false) }

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

  # 退会していなかったらログインできる
  # def active_for_authentication?
  #   super && (is_deleted == false)
  # end

end
