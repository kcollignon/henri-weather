module WeatherServices

  class RetrieveWeather

    require 'httparty'

    def initialize(params)
      @endpoint = params[:endpoint] || 'weather'
      @zip_code = params[:zip_code]
      @units = params[:units] || 'imperial'
    end

    def call
      result = HTTParty.get("http://api.openweathermap.org/data/2.5/#{@endpoint}?zip=#{@zip_code}&units=#{@units}&appid=#{open_weather_token}")
    rescue HTTParty::Error => e
      OpenStruct.new({success?: false, error: e})
    else
      OpenStruct.new({success?: true, payload: result.parsed_response})
    end

    private

    def open_weather_token
      Rails.application.credentials[:open_weather_api_key]
    end

  end
end
