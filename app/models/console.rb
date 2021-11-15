class Console < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :name, :price_per_day, :content, :model, presence: true
end
