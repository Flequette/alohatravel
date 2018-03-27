class RemoveLatitudeAndLongitudeFromDeals < ActiveRecord::Migration[5.1]
  def change
    remove_column :deals, :latitude, :float
    remove_column :deals, :longitude, :float
  end
end
