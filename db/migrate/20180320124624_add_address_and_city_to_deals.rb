class AddAddressAndCityToDeals < ActiveRecord::Migration[5.1]
  def change
    add_column :deals, :address, :string
    add_column :deals, :city, :string
  end
end
