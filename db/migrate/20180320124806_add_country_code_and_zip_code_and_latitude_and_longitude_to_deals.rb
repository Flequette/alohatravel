class AddCountryCodeAndZipCodeAndLatitudeAndLongitudeToDeals < ActiveRecord::Migration[5.1]
  def change
    add_column :deals, :country_code, :string
    add_column :deals, :zip_code, :string
    add_column :deals, :latitude, :float
    add_column :deals, :longitude, :float
  end
end
