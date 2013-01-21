module GalleriesHelper
  def get_gallery_arts gallery
    arts = Dir["app/assets/images/galleries/#{gallery.folder}/*"]
    arts.map! { |a| "galleries/#{gallery.folder}/#{a[/[^\/]+?\.\w+?$/]}" }.sort
  end
end
