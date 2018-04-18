class AddTipsAndIncludedToDeals < ActiveRecord::Migration[5.1]
  def change
    add_column :deals, :tips, :string
    add_column :deals, :included, :string
  end
end
