class AddCountryAndCityToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :country, :string
    add_column :profiles, :city, :string
  end
end
