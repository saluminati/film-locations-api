class V1::FilmLocationsController < ApplicationController

  def locations
    begin
      locations = ShootingLocation.query_locations(query_params)
      render json: {locations: locations.as_json(include: :movie)}
    rescue
      render :json => {error: 'please provide required parameters'}, :status => :bad_request
    end
  end


  private
    def query_params
      params.require(:filter).permit(:city, :release_year, :movie)
    end

end
