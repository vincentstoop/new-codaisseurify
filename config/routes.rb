Rails.application.routes.draw do
  root to: 'artists#index'
  resources :artists, only: [:show] do
    resources :songs, only: [:create, :destroy]
  end

  # resources :photos
end
