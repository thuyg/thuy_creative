ThuyCreative4::Application.routes.draw do

  match "contact", to: "contact#new", via: 'get'
  #match "dispatch_email", to: "contact#dispatch_email", via: 'post'
  #match "contact", to: "public#contact", via: 'get'
  #match "dispatch_email", to: "public#dispatch_email", via: 'post'
  
  #match "contact", to: "contact#contact", as: "contact"
  #match "dispatch_email", to: "contact#dispatch_email",
   # as: "dispatch_email", method: :post
  
  resources :buckets

  root 'public#index'
  get 'show/:permalink', :to => 'public#show'
  
  get 'admin', :to => 'access#index'
  
  match ':controller(/:action(/:id))', :via => [:get, :post]
  
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
