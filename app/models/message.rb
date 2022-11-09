class Message < ApplicationRecord

  belongs_to :customer

  validates :message, presence: true, length: { maximum: 50 }

end
