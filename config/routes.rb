Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
  get '/shooting_locations', to: 'film_locations#locations'
  get '/movies', to: 'movie#by_year'
end
end
