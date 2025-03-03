Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :decks do
    resources :bookings, only: %i[index new create]
  end
end
