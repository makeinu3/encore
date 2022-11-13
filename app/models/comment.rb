class Comment < ApplicationRecord

  belongs_to :customer
  belongs_to :post

  validates :comment, presence: true,length: { minimum: 1, maximum: 150 }

end
