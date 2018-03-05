class AddPhotoToDeals < ActiveRecord::Migration[5.1]
  def change
    add_column :deals, :photo, :string
  end
end
