ActiveAdmin.register ImageSlide do

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "ImageSlide" do
      f.input :name
      f.input :source, :as => :file
      f.input :alt
      f.input :priority
      f.input :href
    end
    f.buttons
  end

end
