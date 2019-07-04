Rails.application.routes.draw do
  devise_for :users,
    :sign_out_via => [ :post, :delete ],
    controllers: {
      registrations: 'users/registrations'
  }
  resources :events
  root 'visitors#index'
end
