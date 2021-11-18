class ChangeReservationsToBookings < ActiveRecord::Migration[6.0]
  def change
    rename_table :reservations, :bookings
  end
end
