class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :console, null: false, foreign_key: true
      t.date :starting_date
      t.date :ending_date
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
