require 'rails_helper'

RSpec.describe ShootingLocation, type: :model do

  it 'creates a Shooting Location' do
    sleep(2) #this will avoid the Google Geocoder API error: OVER_QUERY_LIMIT
    movie = FactoryBot.build(:movie)
    shooting_location = FactoryBot.build(:shooting_location, movie: movie)
    shooting_location.valid?

    expect(shooting_location).to be_valid
  end

  it 'returns the right location coordinates when a valid address is provided' do
    sleep(2) #this will avoid the Google Geocoder API error: OVER_QUERY_LIMIT

    movie = FactoryBot.build(:movie)
    shooting_location = FactoryBot.build(:shooting_location,
                                          movie: movie, address: 'Reservoir Library',
                                          city: 'Reservoir', country: 'Australia')
    shooting_location.valid?

    expect(shooting_location.latitude).to eq(-37.7165004)
    expect(shooting_location.longitude).to eq(145.0056593)

  end

  it 'populate the full adress when latitude and longitude is provided' do
    movie = FactoryBot.build(:movie)
    shooting_location = FactoryBot.build(:shooting_location,
                                          movie: movie, latitude: -37.7165004, longitude: 145.0056593, address: '',
                                          city: '', country: '')
    shooting_location.valid?
    expect(shooting_location.address).to eq('23 Edwardes St, Reservoir VIC 3073, Australia')
  end

end
