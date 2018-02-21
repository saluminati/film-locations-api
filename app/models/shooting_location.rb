class ShootingLocation < ApplicationRecord
  belongs_to :movie

  #validates :address, presence: true
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

end
