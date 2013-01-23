module GalleriesHelper
  # def get_gallery_arts gallery
  #   return [] if gallery.nil?
  #   arts = Dir["app/assets/images/galleries/#{gallery.folder}/*"]
  #   arts.map! { |a| "galleries/#{gallery.folder}/#{a[/[^\/]+?\.\w+?$/]}" }.sort
  # end

  def get_gallery_arts(gallery)
    return [] if gallery.nil?

    dirs = Dir["app/assets/images/galleries/#{gallery.folder}/*"]
    return [] if dirs.empty?

    art_names = Dir[dirs[0] + '/*']
    arts = art_names.map do |an|
      dirs.inject({}) do |h, dir|
        dir = dir[/[^\/]+?$/]
        h[dir.to_sym] = "galleries/#{gallery.folder}/#{dir}/#{an[/[^\/]+?\.\w+?$/]}"; 
        h
      end
    end
  end
end
