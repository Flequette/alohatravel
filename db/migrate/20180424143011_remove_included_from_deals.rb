class RemoveIncludedFromDeals < ActiveRecord::Migration[5.1]
  def change
    remove_column :deals, :included, :string
  end
end
