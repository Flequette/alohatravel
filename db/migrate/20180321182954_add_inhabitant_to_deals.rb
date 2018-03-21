class AddInhabitantToDeals < ActiveRecord::Migration[5.1]
  def change
    add_column :deals, :inhabitant, :string
  end
end
