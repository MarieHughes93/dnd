Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth"}
  root to: 'welcome#home'
  resources :users do
    resources :characters
  end
  
  get '/user' => "users#show", :as => :user_root
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
