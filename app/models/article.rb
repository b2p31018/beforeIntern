class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 10 }
  validates :content, presence: true
  has_one_attached :image
end
