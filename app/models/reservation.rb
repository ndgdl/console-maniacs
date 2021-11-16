class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :console

  validates :starting_date, :ending_date, presence: true
end
