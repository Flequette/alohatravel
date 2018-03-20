class RemoveLocationFromDeals < ActiveRecord::Migration[5.1]
  def change
    remove_column :deals, :location, :text
  end
end
