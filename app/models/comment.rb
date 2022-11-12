class Comment < ApplicationRecord

  belongs_to :customer
  belongs_to :post

  validates :comment, length: { minimum: 1, maximum: 150 }

end
