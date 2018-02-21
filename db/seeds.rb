require 'net/http'
require 'json'

def get_movie_data(url)
  uri = URI(url)
  response = Net::HTTP.get(uri)
  return JSON.parse(response)
end

def create_movie(movie)
  Movie.where(title: movie['title'],
              writter: movie['writer'],
              director: movie['director'],
              release_year: movie['release_year']
             ).first_or_create
end

def create_actors(movie,actors)
  (actors).each do |a|
    next if a.nil?
    movie.actors.where(name: a).first_or_create
  end
end

def create_production_company(movie, production_company)
    movie.production_companies.where(name: production_company).first_or_create
end

def create_distributor(movie, distributor)
  movie.distributors.where(name: distributor).first_or_create
end

def create_location(movie, address, city, country, fun_facts)
  location = movie.shooting_locations.where(landmark_name: address, country: country, city: city, fun_facts: fun_facts).first_or_create
  #location.address = address
end

# Seeding data from San fransico Movie Odata API
data = get_movie_data("https://data.sfgov.org/resource/wwmu-gmzc.json?$limit=15000&$select=:*,%20*")
count = 1
(data).each do |m|
  movie = create_movie(m)

  unless movie.valid?
    puts movie.errors.inspect
    exit
  end

  create_actors(movie, [ m['actor_1'], m['actor_2'], m['actor_3'] ])
  create_production_company(movie, m['production_company']) if m['production_company']
  create_location(movie, m['locations'],'SF', 'USA', m['fun_facts']) if m['locations']
  create_distributor(movie, m['distributor']) if m['distributor']

  movie.save
  puts "#{count} of #{data.length} locations added"
  count = count+1

end
