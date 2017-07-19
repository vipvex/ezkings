Rails.application.routes.draw do
  mount HumanPower::Rails::Engine => "robots.txt"
  root 'pages#home'

  resources :card_highlights
  resources :shipping_options
  resources :taxes
  resources :checklists, except: [:show]
  resources :cards
  resources :attributes
  resources :teams
  resources :players
  resources :card_manufacturers
  resources :card_manufacturer_cards


  # Marketplace
  get 'marketplace', to: 'marketplace#index', as: :marketplace
  get 'marketplace/search'
  
  # Cart
  
  get '/cart', to: 'cart#cart', as: :cart
  get 'cart/orders', as: :orders
  post '/cart/update', to: 'cart#update', as: :update
  post 'cart/purchase', as: :purchase
  post "/cart/stripe_charge", to: 'cart#stripe_charge', as: :stripe_charge
  get 'cart/purchase_complete', as: :purchase_complete
  
  delete '/cart/remove', :to => 'cart#remove_item', as: :remove_cart_item
  post '/cart/add', :to => 'cart#add_cart_item', as: :add_cart_item

  # Pages
  get "/checklists/*url", to: "checklists#show"
  
  resources :pages, except: [:show]
  get '', to: 'pages#home', as: :home
  get '/control', to: 'pages#control'

  get "/*url", to: "pages#show"
  
  
  devise_for :users, :controllers => { :sessions => "sessions", :registrations => "registrations" }
  
end
