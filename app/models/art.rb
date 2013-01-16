class Art < ActiveRecord::Base
  belongs_to :gallery
  attr_accessible :image
  validates :image, :attachment_presence => true
  has_attached_file :image, 
                    :styles => { :thumb => '50x50#' },
                    :path => ":rails_root/app/assets/images/arts/:style/:filename",
                    :url => "/assets/arts/:style/:filename"
end
