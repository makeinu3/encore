class Comment < ApplicationRecord

  belongs_to :customer
  belongs_to :post
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  validates :comment, presence: true,length: { minimum: 1, maximum: 150 }

end
