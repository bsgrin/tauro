module GalleriesHelper
  # def get_gallery_arts gallery
  #   return [] if gallery.nil?
  #   arts = Dir["app/assets/images/galleries/#{gallery.folder}/*"]
  #   arts.map! { |a| "galleries/#{gallery.folder}/#{a[/[^\/]+?\.\w+?$/]}" }.sort
  # end

  def get_image_path folder, path, size
    "assets/galleries/#{folder}/#{size}/" + path[/[^\/]+?\.\w+?$/]
  end

  def get_gallery_arts(gallery)
    return [] if gallery.nil?

    dirs = Dir["app/assets/images/galleries/#{gallery.folder}/*"]
    return [] if dirs.empty?

    art_names = Dir[dirs[0] + '/*'].sort
    arts = art_names.map do |an|
      dirs.inject({}) do |h, dir|
        dir = dir[/[^\/]+?$/]
        h[dir.to_sym] =  "galleries/#{gallery.folder}/#{dir}/#{an[/[^\/]+?\.\w+?$/]}"; 
        h
      end
    end
  end

  def preloaded_images(gallery, size)
    return '[]' if gallery.nil?

    images = Dir["app/assets/images/galleries/#{gallery.folder}/#{size}/*"]

    "[#{images.map { |image| "'" + (get_image_path gallery.folder, image, size) + "'" }.sort.join(', ')}]".html_safe
  end
end
