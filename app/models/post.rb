class Post < ApplicationRecord

  belongs_to :customer
  belongs_to :genre

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_one_attached :image

  def liked_by?(customer)
    likes.exists?(customer_id: customer.id)
  end

  ## 画像がない場合は画像なしにしたいので一旦コメントアウト
  # def get_image
  #   if image.attached?
  #    image
  #   end
  # end

end
