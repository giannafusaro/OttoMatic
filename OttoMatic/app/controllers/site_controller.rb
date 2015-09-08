class SiteController < ApplicationController
  def index
    gon.push({ :zip_codes => ZIP_CODES, :city_names => CITY_NAMES, :cities => CITIES })
  end
end
