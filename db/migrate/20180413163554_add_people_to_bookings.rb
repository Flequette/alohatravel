class AddPeopleToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :nb_people, :integer
  end
end
