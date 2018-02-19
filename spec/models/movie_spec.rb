require 'rails_helper'

RSpec.describe Movie, type: :model do

  it 'creates a Movie' do
    movie = FactoryBot.create(:movie)
    movie.valid?
    expect(movie).to be_valid
  end

  context 'Movie release_year is invalid or empty' do

    it 'invalidates, if the release_year is nil' do
      movie = FactoryBot.build(:movie, release_year: nil)
      movie.valid?
      expect(movie.errors[:release_year]).to include("can't be blank")
    end

    it 'invalidates, if the release_year is not a number' do
      movie = FactoryBot.build(:movie, release_year: '0a')
      movie.valid?
      expect(movie.errors[:release_year]).to include("is not a number")
    end

    it 'invalidates, if the release_year is less than 1920' do
      movie = FactoryBot.build(:movie, release_year: 1919)
      movie.valid?
      expect(movie.errors[:release_year]).to include("must be greater than 1920")
    end

    it 'invalidates, if the release_year is greater than current year' do
      year = (Date.today.year)+1
      movie = FactoryBot.build(:movie, release_year: year)
      movie.valid?
      expect(movie.errors[:release_year]).to include("must be less than #{Date.today.year}")
    end

  end

  context 'invalid or empty title is provided' do
    it 'invalidates, when title is empty' do
      movie = FactoryBot.build(:movie, title: "")
      movie.valid?
      expect(movie.errors[:title]).to include("can't be blank")
    end

    it 'invalidates, when title is nil' do
      movie = FactoryBot.build(:movie, title: nil)
      movie.valid?
      expect(movie.errors[:title]).to include("can't be blank")
    end
  end

  context 'invalid or empty writter is provided' do
    it 'invalidates, when writter is empty' do
      movie = FactoryBot.build(:movie, writter: "")
      movie.valid?
      expect(movie.errors[:writter]).to include("can't be blank")
    end

    it 'invalidates, when writter is nil' do
      movie = FactoryBot.build(:movie, writter: nil)
      movie.valid?
      expect(movie.errors[:writter]).to include("can't be blank")
    end
  end

  context 'invalid or empty director is provided' do
    it 'invalidates, when director is empty' do
      movie = FactoryBot.build(:movie, director: "")
      movie.valid?
      expect(movie.errors[:director]).to include("can't be blank")
    end

    it 'invalidates, when director is nil' do
      movie = FactoryBot.build(:movie, director: nil)
      movie.valid?
      expect(movie.errors[:director]).to include("can't be blank")
    end
  end

  it 'assign actors to a movie' do
    actor = FactoryBot.create(:actor)
    actor2 = FactoryBot.create(:actor, name: 'Another name')
    movie = FactoryBot.create(:movie)
    movie.actors << actor
    movie.actors << actor2
    expect(movie.actors.length).to eq(2)
  end

  it 'assign distributor to a movie' do
    distributor = FactoryBot.create(:distributor)
    movie = FactoryBot.create(:movie)
    movie.distributors << distributor
    expect(movie.distributors.length).to eq(1)
  end

  it 'assign Production Company to a movie' do
    production_company = FactoryBot.create(:production_company)
    movie = FactoryBot.create(:movie)
    movie.production_companies << production_company
    expect(movie.production_companies.length).to eq(1)
  end


end
