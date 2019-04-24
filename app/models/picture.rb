class Picture < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_one_attached :image
end
