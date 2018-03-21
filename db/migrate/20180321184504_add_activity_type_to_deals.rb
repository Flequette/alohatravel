class AddActivityTypeToDeals < ActiveRecord::Migration[5.1]
  def change
    add_column :deals, :activity_type, :string
  end
end
