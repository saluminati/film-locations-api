require 'rails_helper'

RSpec.describe Actor, type: :model do

  it 'creates an actor' do
    actor = FactoryBot.build(:actor)
    actor.valid?
    expect(actor).to be_valid
  end

  it 'assigns movies to an actor' do
    actor = FactoryBot.create(:actor)
    movie = FactoryBot.create(:movie)
    movie2 = FactoryBot.create(:movie)
    actor.movies << movie
    actor.movies << movie2
    expect(actor.movies.length).to eq(2)
  end

end
