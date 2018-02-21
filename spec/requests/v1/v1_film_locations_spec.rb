require 'rails_helper'

RSpec.describe "V1::FilmLocations", type: :request do
  describe "GET /v1_all_locations" do

    before(:all) do
      movie = FactoryBot.create(:movie)
      FactoryBot.create(:shooting_location,movie: movie)
      FactoryBot.create(:shooting_location,movie: movie, landmark_name: 'Mason & California Streets (Nob Hill)')
    end

    it "returns locations json with HTTP code 200" do
      get v1_all_locations_path, params: {city: 'SF'}
      json = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(json['locations'].length).to be >= 2
    end

    context 'city parameter is not provided' do
      it "returns error json with HTTP code 400" do
        get v1_all_locations_path
        json = JSON.parse(response.body)
        expect(response).to have_http_status(400)
      end
    end


  end
end
