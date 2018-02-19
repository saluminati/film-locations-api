require 'rails_helper'

RSpec.describe Distributor, type: :model do
  it 'creates a Distributor' do
    distributor = FactoryBot.create(:distributor)
    distributor.valid?
    expect(distributor).to be_valid
  end

  context 'Distributor name is invalid or empty' do

    it 'invalidates, if the name is nil' do
      distributor = FactoryBot.build(:distributor, name: nil)
      distributor.valid?
      expect(distributor.errors[:name]).to include("can't be blank")
    end

    it 'invalidates, if the name is empty' do
      distributor = FactoryBot.build(:distributor, name: "")
      distributor.valid?
      expect(distributor.errors[:name]).to include("can't be blank")
    end

  end

  it 'assigns movie to a distributor' do
    distributor = FactoryBot.create(:distributor)
    movie = FactoryBot.create(:movie)
    distributor.movies << movie
    expect(distributor.movies.length).to eq(1)
  end

end
