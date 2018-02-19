FactoryBot.define do
  factory :shooting_location do
    country 'USA'
    city 'SF'
    address 'Epic Roasthouse (399 Embarcadero)'
    latitude 37.7908379
    longitude -122.3915453
    fun_facts 'Francis Ford Coppola allegedly wrote large portions of "The Godfather" trilogy in Café Trieste.'

    association :movie
  end
end
