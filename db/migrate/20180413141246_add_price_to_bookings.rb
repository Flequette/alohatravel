class AddPriceToBookings < ActiveRecord::Migration[5.1]
  def change
    add_monetize :bookings, :price, currency: { present: false }
  end
end
