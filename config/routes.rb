Rails.application.routes.draw do
   resources :sessions, only: [:new, :create, :destroy]

  # You can have the root of your site routed with "root"
   get 'sessions/logout' => 'sessions#logout'
   post 'users/dum', to: 'users#dum', :as => 'dum'
   get 'users/dum', to: 'users#dum', :as => 'dumget'
   get 'users/admincreation', to: 'users#admincreation', :as => 'admins'
   get 'users/admdel', to: 'users#admdel', :as => 'admdel'
   get 'users/admview', to: 'users#admview', :as => 'admview'
   get 'users/memsview', to: 'users#memsview', :as => 'memsview'
   get 'users/libmems', to: 'users#libmems', :as => 'libmems'
   get 'users/libuser', to: 'users#libuser', :as => 'libuser'
   get 'users/addrooms', to: 'users#addrooms', :as => 'addrooms'
   get 'users/memshist', to: 'users#memshist', :as => 'memshist'
   get 'users/memsdel', to: 'users#memsdel', :as => 'memsdel'
   get '/users/index',to: 'users#index',as: 'users'
   post '/users/delete', to: 'users#destroy', as: 'del_user'
   #get '/users/index',to: 'users#index',as: 'users_get'
   post '/users/new',to: 'users#new',as: 'new_user'
   get '/users/edit',to: 'users#edit',as:'edit_user'
   get '/users/show', to: 'users#show', as: 'user'
   get '/users/destroy',to: 'users#destroy'
   post '/users/update',to: 'users#update', as: 'update_user'
   post '/users/create',to: 'users#create', as: 'create_user'
  #get '/users/index',to: 'users#index',as: 'users'
   get '/signin', to: 'sessions#new'
   get '/signout', to: 'sessions#destroy', as: 'delete'

   #root 'users#index'
    root 'sessions#new'
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
