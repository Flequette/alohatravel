class AddCountryToDeals < ActiveRecord::Migration[5.1]
  def change
    add_column :deals, :country, :string
  end
end
