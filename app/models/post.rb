class Post < ApplicationRecord

  belongs_to :customer
  belongs_to :genre

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_one_attached :image

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  validates :place, presence: true
  validates :show_name, presence: true
  validates :show_date, presence: true


  def liked_by?(customer)
    likes.exists?(customer_id: customer.id)
  end

end
