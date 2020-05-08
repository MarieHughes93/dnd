Rails.application.routes.draw do
  root to: 'welcome#home'
  resources :characters
  devise_for :users, contollers:{
    sessions: 'user/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
