class RemoveProfileAndDealFromBooking < ActiveRecord::Migration[5.1]
  def change
    remove_reference :bookings, :profile, foreign_key: true
    remove_reference :bookings, :deal, foreign_key: true
  end
end
