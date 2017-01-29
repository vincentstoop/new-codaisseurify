Rails.application.routes.draw do
  root to: 'artists#index'
  resources :artists, only: [:show, :destroy] do
    resources :songs, only: [:create, :destroy]
  end

  delete 'artist/:id/delete_all_songs', to: 'artists#delete_all_songs',
                                      as: 'delete_songs'
  # resources :photos
end
