Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: %i[index show edit update] do
    get 'book_chef', on: :member
    post 'create_booking', on: :member
    get 'my_bookings', on: :collection
    delete 'bookings/:id', to: 'users#destroy_booking', as: :booking
  end
end
