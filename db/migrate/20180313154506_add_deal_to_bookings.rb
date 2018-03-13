class AddDealToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :deal, foreign_key: true
  end
end
