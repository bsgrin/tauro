class PagesController < ApplicationController
  def home
    @img_slides = ImageSlide.order("priority DESC, updated_at DESC")
  end

  def portfolio
    @galleries = Gallery.all
  end

  # def production
  # end

  def info
  end
end
