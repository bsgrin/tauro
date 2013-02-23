module GalleriesHelper
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

  def gallery_lister(galleries, active_gallery)
    active_gallery_index = -1

    onclick = "adjustSideBarAjaxCompleted(this);"
    lister_html = galleries.each_with_index.inject("") do |acc, (g, i)| 
      is_active = active_gallery.id == g.id
      active_gallery_index = i if is_active
      klass = 'link load-g link-to-gallery' + (is_active ? ' active-g' : '')

      acc << "<p>#{ link_to g.name, g, :id => "g#{g.id}", :class => klass, :onclick => onclick, :remote => true }</p>"
    end

    prev_index = prev_cycled galleries.length, active_gallery_index
    next_index = next_cycled galleries.length, active_gallery_index

    prev_gallery = galleries[prev_index]
    next_gallery = galleries[next_index]
    up = link_to prev_gallery, :id => "up", :onclick => onclick, :class => "load-g arrow-to-gallery", :next => "#{prev_index}", :remote => true do
      image_tag 'up.png'
    end
    down = link_to next_gallery, :id => "down", :onclick => onclick, :class => "load-g arrow-to-gallery", :next => "#{next_index}",:remote => true do
      image_tag 'down.png'
    end

    up + "<div class=\"side-bar-container\"><div class=\"inner\">#{lister_html}</div></div>".html_safe + down
  end

  private

    def next_cycled(list_length, current_index)
      raise "Too big index (next_cycled)" if current_index >= list_length
      current_index == list_length - 1 ? 0 : current_index + 1
    end

    def prev_cycled(list_length, current_index)
      raise "Too small index (prev_cycled)" if current_index < 0
      current_index == 0 ? list_length - 1 : current_index - 1
    end
end
