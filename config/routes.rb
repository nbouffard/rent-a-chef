Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  resources :users, only: %i[index show] do
    get 'book_chef', on: :member
    post 'create_booking', on: :member
    get 'check_availability', on: :member
  end

  resources :chefs, only: [:edit, :update]
  resources :bookings, only: [:new, :create]
end
