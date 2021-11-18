class Console < ApplicationRecord
  belongs_to :user

  has_many_attached :photos
  has_many :bookings, dependent: :destroy

  validates :name, :price_per_day, :content, :model, presence: true
  validates :price_per_day, numericality: { only_float: true }

  def address
    self.user.geocode
  end

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }


end
