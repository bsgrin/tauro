class PagesController < ApplicationController
  def home
    @banners = Banner.all
  end

  def portfolio
  end

  # def production
  # end

  def contacts
  end
end
