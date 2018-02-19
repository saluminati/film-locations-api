require 'rails_helper'

RSpec.describe ProductionCompany, type: :model do

  it 'creates a Production Company' do
    production_company = FactoryBot.create(:production_company)
    production_company.valid?
    expect(production_company).to be_valid
  end

  context 'Production Company name is invalid or empty' do

    it 'invalidates, if the name is nil' do
      production_company = FactoryBot.build(:production_company, name: nil)
      production_company.valid?
      expect(production_company.errors[:name]).to include("can't be blank")
    end

    it 'invalidates, if the name is empty' do
      production_company = FactoryBot.build(:production_company, name: "")
      production_company.valid?
      expect(production_company.errors[:name]).to include("can't be blank")
    end

  end

  it 'assigns movie to a Production Company' do
    production_company = FactoryBot.create(:production_company)
    movie = FactoryBot.create(:movie)
    production_company.movies << movie
    expect(production_company .movies.length).to eq(1)
  end

end
