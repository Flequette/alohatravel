class AddTypeAndTimeToDeals < ActiveRecord::Migration[5.1]
  def change
    add_column :deals, :type, :string
    add_column :deals, :time, :string
  end
end
