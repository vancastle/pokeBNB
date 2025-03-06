Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :decks, only: %i[index show] do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: :index

  get "my-decks", to: "decks#my_decks", as: :my_decks
end
