Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
  get '/all_locations', to: 'film_locations#show_all'
end
end
