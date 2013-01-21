class AddFolderToGalleries < ActiveRecord::Migration
  def self.up
    add_column :galleries, :folder, :string
  end

  def self.down
    remove_column :galleries, :folder
  end
end
