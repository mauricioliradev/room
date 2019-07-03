Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      registrations: 'users/registrations'
  }
  resources :events
  root 'visitors#index'
end
