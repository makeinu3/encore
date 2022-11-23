class Post < ApplicationRecord

  belongs_to :customer
  belongs_to :genre

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_customers, through: :likes, source: :customer

  has_one_attached :image

  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true, length: { maximum: 1000 }
  validates :image, presence: true
  validates :place, presence: true
  validates :show_name, presence: true
  validates :show_date, presence: true


  # 公開/非公開
  scope :publish_posts, -> { where(customer: Customer.publish) }
  scope :unpublish_posts, -> { where(customer: Customer.unpublish) }


  def liked_by?(customer)
    likes.exists?(customer_id: customer.id)
  end

end
