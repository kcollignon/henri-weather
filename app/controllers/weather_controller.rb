class WeatherController < ApplicationController

  def index
    @saved_locations = SavedLocation.all
  end

  def search
    @zip_code = params[:zip_code]
    @units = params[:units]
    @result = WeatherServices::RetrieveWeather.new({endpoint: 'weather', zip_code: @zip_code, units: @units}).call
    if @result && @result.success?
      render :search, layout: false
    else
      render status: 500
    end
  end
end
