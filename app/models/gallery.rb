class Gallery < ActiveRecord::Base
  attr_accessible :name, :text, :arts_attributes
  has_many :arts
  accepts_nested_attributes_for :arts, allow_destroy: true
  validates :name, :presence => :true
end
