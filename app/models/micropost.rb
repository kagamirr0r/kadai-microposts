class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }

  has_many :likes, dependent: :destroy
  has_many :favorited, through: :likes, source: :user
end
