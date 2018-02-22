require 'rails_helper'

RSpec.describe "V1::FilmLocations", type: :request do

  describe "GET /v1/shooting_locations" do

    before do
      movie = FactoryBot.create(:movie, release_year: 2017)
      movie2 = FactoryBot.create(:movie, title: 'Some other movie', release_year: 2017)

      FactoryBot.create(:shooting_location,movie: movie)
      FactoryBot.create(:shooting_location,movie: movie2)
      FactoryBot.create(:shooting_location,movie: movie, landmark_name: 'Mason & California Streets (Nob Hill)')
    end

    it "returns locations json with HTTP code 200" do
      get v1_shooting_locations_path, params: {filter: {city: 'SF', release_year: 2017, movie: 'Some movie'}}
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(json['locations'].length).to eq(2)
    end

    it "returns locations json of all the movies filmed in a specific year" do
      get v1_shooting_locations_path, params: {filter: {city: 'SF', release_year: 2017}}
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(json['locations'].length).to eq(3)
    end

    context 'parameters are not provided' do
      it "returns error json with HTTP code 400" do
        get v1_shooting_locations_path
        json = JSON.parse(response.body)
        expect(response).to have_http_status(400)
      end
    end

  end

end
