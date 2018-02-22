class Movie < ApplicationRecord
  scope :by_release_year, -> (release_year) { where("release_year = ?", release_year)}

  validates :title, presence: true
  #validates :writter, presence: true
  validates :director, presence: true
  validates :release_year,
             numericality: {less_than: (Date.today.year)+1, greater_than: 1900, only_integer: true },
             presence: true

  has_and_belongs_to_many :actors
  has_and_belongs_to_many :distributors
  has_and_belongs_to_many :production_companies
  has_many :shooting_locations
end
