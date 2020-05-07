Rails.application.routes.draw do
  resources :characters
  root to: 'application#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
