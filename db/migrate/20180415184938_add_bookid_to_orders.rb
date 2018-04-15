class AddBookidToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :bookid, :integer
  end
end
