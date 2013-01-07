class Banner < ActiveRecord::Base
  attr_accessible :image_path, :name, :raw_html, :text

  validates :name,  :presence => true,
                    :length   => { :maximum => 50 }


  # def as_img
  #   "<img src=\"#{image_path}\" alt=\"#{name}\">"
  # end

  # def as_text
  #   "<div class=\"article\">#{text}</div>"
  # end

end
