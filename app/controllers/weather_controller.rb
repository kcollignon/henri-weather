class WeatherController < ApplicationController

  def index
  end

  def search
    @result = WeatherServices::RetrieveWeather.new({endpoint: 'weather', zip_code: params[:zip_code], units: 'imperial'}).call
    if @result && @result.success?
      render :search, layout: false
    else
      render status: 500
    end
  end
end
