class CreateImageSlides < ActiveRecord::Migration
  def change
    create_table :image_slides do |t|
      t.string :name, :null => false
      t.attachment :source
      t.string :alt
      t.integer :priority, :null => false, :default => 0

      t.timestamps
    end
  end
end
