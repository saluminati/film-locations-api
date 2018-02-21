class Actor < ApplicationRecord

  #validates :name,
  #          :presence => true,
  #          :length => {:minimum => 5, :maximum => 100 },
  #          :uniqueness => true

  has_and_belongs_to_many :movies

end
