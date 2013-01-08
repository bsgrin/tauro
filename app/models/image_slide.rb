class ImageSlide < ActiveRecord::Base
  has_attached_file :source,
                    :path => ":rails_root/app/assets/images/slides/:filename"
  attr_accessible :alt, :name, :priority, :source

  validates :name, :presence => true
  validates :priority, :presence => true
  validates :source, :attachment_presence => true
end
