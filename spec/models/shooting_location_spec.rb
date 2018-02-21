require 'rails_helper'

RSpec.describe ShootingLocation, type: :model do

  it 'creates a Shooting Location' do

    movie = FactoryBot.create(:movie)
    shooting_location = FactoryBot.build(:shooting_location, movie: movie)
    shooting_location.geocode
    shooting_location.valid?

    expect(shooting_location).to be_valid
  end

  it 'returns the right location coordinates when a valid address is provided' do
    movie = FactoryBot.build(:movie)
    shooting_location = FactoryBot.build(:shooting_location,
                                          movie: movie, landmark_name: 'Reservoir Library',
                                          city: 'Reservoir', country: 'Australia')
    shooting_location.geocode
    shooting_location.valid?

    expect(shooting_location.latitude).to eq(-37.7165004)
    expect(shooting_location.longitude).to eq(145.0056593)

  end

  it 'populate the full adress when latitude and longitude is provided' do
    movie = FactoryBot.build(:movie)
    shooting_location = FactoryBot.build(:shooting_location,
                                          movie: movie, latitude: -37.7165004, longitude: 145.0056593, address: '',
                                          city: '', country: '')
    shooting_location.reverse_geocode
    shooting_location.valid?
    expect(shooting_location.address).to eq('23 Edwardes St, Reservoir VIC 3073, Australia')
  end

end
