class AddProfileToDeals < ActiveRecord::Migration[5.1]
  def change
    add_reference :deals, :profile, foreign_key: true
  end
end
