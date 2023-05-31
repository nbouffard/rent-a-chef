class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :chef, null: false, foreign_key: { to_table: :users }
      t.string :status
      t.date :date

      t.timestamps
    end
  end
end
