Rails.application.routes.draw do
  root to: 'welcome#home'
  devise_for :users
  resources :users, only: [:show, :index ] do
    resources :characters
  end
  
  get '/user/:id' => "users#show", :as => :user_root
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
