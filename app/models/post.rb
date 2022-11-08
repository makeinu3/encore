class Post < ApplicationRecord

  belongs_to :customer
  belongs_to :genre

  has_many :comments, dependent: :destroy

  has_one_attached :image

  # def get_image
  #   if image.attached?
  #    image
  #   end
  # end

end
