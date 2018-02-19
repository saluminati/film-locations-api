class Movie < ApplicationRecord
  validates :title, presence: true
  validates :writter, presence: true
  validates :director, presence: true
  validates :release_year,
             numericality: {less_than: Date.today.year, greater_than: 1920, only_integer: true },
             presence: true

  has_and_belongs_to_many :actors
end
