ActiveAdmin.register Gallery do
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :name
      f.input :text
      f.input :folder, :hint => "You can leave this field blank then Name field will be used."
    end

    f.buttons
  end
end
