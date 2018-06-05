class AddLanguageToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :language, :string
  end
end
