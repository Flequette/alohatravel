class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.text :location
      t.string :phone_number
      t.text :description

      t.timestamps
    end
  end
end
