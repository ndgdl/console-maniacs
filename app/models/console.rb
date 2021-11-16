class Console < ApplicationRecord
  belongs_to :user

  has_many_attached :photos
  has_many :reservations

  validates :name, :price_per_day, :content, :model, presence: true
  validates :price_per_day, numericality: { only_float: true }
end
