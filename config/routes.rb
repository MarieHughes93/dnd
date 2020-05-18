Rails.application.routes.draw do
  root to: 'welcome#home'
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations"}
  get '/campaigns/dm', to: 'campaigns#dm', as: :dm_root
  get '/users/:id' => "users#show", :as => :users_root
  resources :users do
    resources :characters
  end

  resources :campaigns do
    resources :memberships
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
