class GalleriesController < ApplicationController
  def index
    get_galleries_and_show :with_id => :random
  end

  def show
    get_galleries_and_show :with_id => params[:id]
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

    def get_galleries_and_show params
      @galleries = Gallery.all
      @gallery_to_show = params[:with_id] == :random ? Gallery.all.sample : Gallery.find(params[:with_id])
    end
end
