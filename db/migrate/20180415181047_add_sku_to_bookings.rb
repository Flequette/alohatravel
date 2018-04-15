class AddSkuToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :sku, :string
  end
end
