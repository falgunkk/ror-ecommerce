Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  post "ajax_call", to: "home#ajax_call"
  devise_for :users
  namespace :api do
    get 'private_api', to: 'test#private_api'
    get 'public_api', to: 'test#public_api'
    post 'authenticate', to: 'base#authenticate'
  end
end
