class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.string :statut
      t.text :message
      t.references :profile, foreign_key: true
      t.references :deal, foreign_key: true

      t.timestamps
    end
  end
end
