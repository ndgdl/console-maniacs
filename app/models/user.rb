class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :consoles
  has_many :bookings

  validates :first_name, :last_name, :phone_number, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
