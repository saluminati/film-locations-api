class ShootingLocation < ApplicationRecord
  belongs_to :movie

  geocoded_by :full_address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address? }
  after_validation :reverse_geocode

  def full_address
    [address, city, country].compact.join(', ')
  end

end
