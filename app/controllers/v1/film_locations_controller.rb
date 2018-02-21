class V1::FilmLocationsController < ApplicationController

  def show_all
    unless params[:city].present?
      render :json => {error: 'please provide city parameter in the request'}, :status => :bad_request
    else
      locations = ShootingLocation.eager_load(:movie).where("city = ?", params[:city]).all
      render json: {locations: locations.as_json(include: :movie)}
    end
  end

end
