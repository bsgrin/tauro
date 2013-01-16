class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.attachment :image
      t.references :gallery

      t.timestamps
    end
    add_index :arts, :gallery_id
  end
end
