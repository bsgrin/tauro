class GalleriesController < ApplicationController
  def index
    redirect_to :action => 'show', :id => Gallery.all.sample.id
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
