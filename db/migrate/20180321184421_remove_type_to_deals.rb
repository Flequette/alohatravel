class RemoveTypeToDeals < ActiveRecord::Migration[5.1]
  def change
    remove_column :deals, :type, :string
  end
end
