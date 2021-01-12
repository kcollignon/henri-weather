class SavedLocationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_saved_location, only: [:destroy]

  def create
    @saved_location = SavedLocation.new(saved_location_params)
    @saved_location.save
    respond_to do |format|
     format.html
     format.js { render partial: 'location', locals: {location: @saved_location} }
    end
  end

  def destroy
    @saved_location.destroy
  end

  private

  def set_saved_location
    @saved_location = SavedLocation.find(params[:id])
  end

  def saved_location_params
    params.require(:saved_location).permit(:name, :zip_code)
  end


end
