Rails.application.routes.draw do
  root to: 'welcome#home'
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  get '/users/:id' => "users#show", :as => :users_root
  resources :users do
    resources :characters
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
