class AddHrefToImageSlides < ActiveRecord::Migration
  def change
    add_column :image_slides, :href, :string, :null => true
  end
end
