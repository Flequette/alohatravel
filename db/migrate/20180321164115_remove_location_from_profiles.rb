class RemoveLocationFromProfiles < ActiveRecord::Migration[5.1]
  def change
    remove_column :profiles, :location, :text
  end
end
