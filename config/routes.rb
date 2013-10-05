Flipbook::Application.routes.draw do
  
  resources :posts
  resources :pages
  resources :sessions
  
  root :to => "posts#index"
  
  match '/create',  :to =>  "posts#create"
  match 'contact' => 'pages#new', :as => 'contact', :via => :get
  match 'contact' => 'pages#create', :as => 'contact', :via => :post
  match '/about',   :to => 'pages#about'
  
  match '/login'  => 'sessions#new',     :as => :login
  match '/feed',  :to =>  'posts#feed'
  match '/logout' => 'sessions#destroy', :as => :logout
  
 
end
