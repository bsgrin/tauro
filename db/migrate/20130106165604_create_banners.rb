class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :name
      t.string :image_path
      t.text :text
      t.text :raw_html

      t.timestamps
    end
  end
end
