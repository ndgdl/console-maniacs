class CreateConsoles < ActiveRecord::Migration[6.0]
  def change
    create_table :consoles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.float :price_per_day
      t.string :content
      t.boolean :availibity, default: true
      t.string :model

      t.timestamps
    end
  end
end
