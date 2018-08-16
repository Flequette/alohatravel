class AddFascinateAndWhyGuideAndStoryToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :fascinate, :text
    add_column :profiles, :why_guide, :text
    add_column :profiles, :story, :text
  end
end
