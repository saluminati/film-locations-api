class ShootingLocation < ApplicationRecord
  belongs_to :movie


  validates :city, presence: true
  validates :country, presence: true
  validates :landmark_name, :presence => {:message => "%{value} already exist" }, :uniqueness => {:scope => [:movie_id, :landmark_name]}


  geocoded_by :full_address
  reverse_geocoded_by :latitude, :longitude

  #after_create :geocode
  #after_create :reverse_geocode

  def full_address
    [landmark_name, city, country].compact.join(', ')
  end


  def self.query_locations(params)
    query_params = {}

    (params).each do |key, value|
      construct_query(key, value, query_params)
    end

    ShootingLocation.eager_load(:movie).where(query_params).all
  end

  private
  def self.construct_query(key, value , query_hash)

    case key
    when 'movie'
      query_hash['movies'].nil? ? query_hash.store('movies', {title: value}) : query_hash['movies'].merge!({title: value})
    when 'city'
      query_hash.store('city', value)
    when 'release_year'
      query_hash['movies'].nil? ? query_hash.store('movies', {release_year: value}) : query_hash['movies'].merge!({release_year: value})
    end

    query_hash
  end

end
