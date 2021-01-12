require 'spec_helper'
require 'rails_helper'

RSpec.describe WeatherHelper, type: :helper do
  it 'Calculates Average Daily Temperature' do
    high = 100
    low = 50
    expect(average_daily_temperature(high, low)).to eq(75)
  end
end
