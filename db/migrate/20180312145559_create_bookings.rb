class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :status
      t.text :message
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
