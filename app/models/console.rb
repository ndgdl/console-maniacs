class Console < ApplicationRecord
  belongs_to :user

  has_many_attached :photos
  has_many :bookings, dependent: :destroy

  validates :name, :price_per_day, :content, :model, presence: true
  validates :price_per_day, numericality: { only_float: true }

  def address
    self.user.geocode
  end

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
