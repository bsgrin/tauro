class Gallery < ActiveRecord::Base
  attr_accessible :name, :text, :folder
  validates :name, :presence => :true
  validates :folder, :presence => :true

  before_validation do
    self.folder = self.name.gsub(' ', '_').downcase if self.folder.nil? or self.folder.blank?
  end

  def path_to_arts
    "app/assets/images/galleries/#{self.folder}/*"
  end
end
