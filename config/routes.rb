Rails.application.routes.draw do
  root to: 'welcome#home'
  resources :characters
  devise_for :users, contollers:{
    omniauth_callbacks: 'omniauth'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
