class AddingUnavailableDateInBookings < ActiveRecord::Migration[6.0]
  def change
    rename_column :bookings, :starting_date, :start_date
    rename_column :bookings, :ending_date, :end_date
  end
  end
end
