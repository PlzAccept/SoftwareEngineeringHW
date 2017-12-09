Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  get '/movies/similar_movies/:id', :to => 'movies#similar_movies', :as => 'similar_movies'
  root :to => redirect('/movies')
end
