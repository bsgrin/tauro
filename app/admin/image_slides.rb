ActiveAdmin.register ImageSlide do

  form do |f|
    f.inputs "ImageSlide" do
      f.input :name
      f.input :source, :as => :file
      f.input :alt
      f.input :priority
    end
    f.buttons
  end

end
