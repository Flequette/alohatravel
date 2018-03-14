class AddProfileToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :profile, foreign_key: true
  end
end
