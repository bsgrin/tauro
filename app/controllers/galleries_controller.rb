class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
    @gallery_to_show = Gallery.all.sample
    # need to handle the case when id is not valid
  end

  def show
    @galleries = Gallery.all
    @gallery_to_show = Gallery.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
end
