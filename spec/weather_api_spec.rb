require 'spec_helper'
require 'rails_helper'

RSpec.describe 'Open Weather API' do
  it 'Completes succcesful GET request' do
    stub = stub_request(:get, "http://api.openweathermap.org/data/2.5/weather").with(query: {"zip" => "85085", "appid" => Rails.application.credentials[:open_weather_api_key]})
    HTTParty.get("http://api.openweathermap.org/data/2.5/weather?zip=85085&appid=#{Rails.application.credentials[:open_weather_api_key]}")
    expect(stub).to have_been_requested
  end
end
