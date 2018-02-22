class V1::MovieController < ApplicationController

  def by_city
    begin
      movies = Movie.eager_load(:shooting_locations).where('shooting_locations.city=?',query_params[:city])
      render json: {movies: movies.as_json}
    rescue
      render :json => {error: 'please provide required parameters'}, :status => :bad_request
    end
  end


  private
    def query_params
      params.require(:filter).permit(:release_year, :city)
    end

end
