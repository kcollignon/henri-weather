require 'spec_helper'
require 'rails_helper'


RSpec.describe WeatherController, :type => :controller do
  describe "GET index" do
    it "assigns @saved_locations" do
      get :index
      expect(assigns(:saved_locations)).to eq([])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET search" do
    it "returns successful response" do
      VCR.use_cassette("search") do
        get :search, params: { zip_code: '85085' }
      end
      expect(response.status).to eq 200
    end

    it "returns current temperature" do
      VCR.use_cassette("search") do
        get :search, params: { zip_code: '85085' }
      end
      expect(response.status).to eq 200
      expect(assigns(:result))
      expect(assigns(:result).success?).to be true
      expect(assigns(:result).payload["main"]["temp"]).not_to be_nil
    end

    it "returns error" do
      VCR.use_cassette("badsearch") do
        get :search, params: { zip_code: '12dsfdszx' }
      end
      expect(response.status).to eq 200
      expect(assigns(:result))
      expect(assigns(:result).success?).to be false
    end
  end
end
