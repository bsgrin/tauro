class PagesController < ApplicationController
  def home
    @img_slides = ImageSlide.order("priority DESC, updated_at DESC")
  end

  def portfolio
  end

  # def production
  # end

  def contacts
  end
end
