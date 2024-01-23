Rails.application.routes.draw do
  root to: 'interviews#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users
  resources :profiles
  resources :interviews
end
