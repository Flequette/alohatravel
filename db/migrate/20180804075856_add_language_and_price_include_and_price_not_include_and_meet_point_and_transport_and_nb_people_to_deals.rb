class AddLanguageAndPriceIncludeAndPriceNotIncludeAndMeetPointAndTransportAndNbPeopleToDeals < ActiveRecord::Migration[5.1]
  def change
    add_column :deals, :language, :string
    add_column :deals, :price_include, :string
    add_column :deals, :price_not_include, :string
    add_column :deals, :meet_point, :string
    add_column :deals, :transport, :string
    add_column :deals, :nb_people, :integer
  end
end
