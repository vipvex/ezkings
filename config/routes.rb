Rails.application.routes.draw do
  resources :checklists, except: [:show]
  #Mercury::Engine.routes
  resources :card_manufacturer_cards
  get 'cart/cart'
  get 'cart/purchase_complete', as: :purchase_complete
  post 'cart/purchase', as: :purchase
  get 'cart/orders', as: :orders


  resources :cards
  resources :attributes
  resources :teams
  resources :players
  resources :card_manufacturers
  
  get 'card/express_checkout', as: :express_checkout
  
  root 'marketplace#index'
  
  devise_for :users, :controllers => { :sessions => "sessions", :registrations => "registrations" }
  get 'marketplace/index', as: :marketplace

  get 'marketplace/search'
  get '/cart', to: 'cart#cart', as: :cart
  
  delete '/cart/remove', :to => 'cart#remove_item', as: :remove_cart_item
  post '/cart/add', :to => 'cart#add_cart_item', as: :add_cart_item


  get "/p/*url", to: "pages#show"
  get "/checklists/*url", to: "checklists#show"
  
  resources :pages, except: [:show]
  get '/control', to: 'pages#control' 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
