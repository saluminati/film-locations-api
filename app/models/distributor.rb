class Distributor < ApplicationRecord
  validates :name,
            :length => {:minimum => 5, :maximum => 100 },
            :presence => true

  has_and_belongs_to_many :movies
end
