Rails.application.routes.draw do
  #resources :artists, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :artists do
    resources :songs, only: [:new, :index, :create]
  end
  resources :songs, only: [:show]
  resources :playlists, only: [:index, :new, :create, :show, :edit, :update]
end
