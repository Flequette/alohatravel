class CreateDeals < ActiveRecord::Migration[5.1]
  def change
    create_table :deals do |t|
      t.string :name
      t.text :location
      t.text :description
      t.integer :price
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
