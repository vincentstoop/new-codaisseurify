Rails.application.routes.draw do
  root to: 'artists#index'
  resources :artists, only: [:show] do
    resources :songs, except: [:index, :show]
  end

  # resources :photos
end
