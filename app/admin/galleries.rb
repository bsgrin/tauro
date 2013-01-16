ActiveAdmin.register Gallery do
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :name
      f.input :text

      f.has_many :arts do |p|
        p.input :image
      end
    end

    f.buttons
  end
end
