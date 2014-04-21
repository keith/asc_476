Asc476::Application.routes.draw do

  root 'applicants#new'
  resources :emails, except: [:new, :create, :destroy]
  resources :positions, only: [:show, :edit, :update]
  resources :professors, except: [:create, :new] do
    post :email, on: :member
  end

  resources :users, except: [:show] do
    post :email, on: :member
  end

  resources :reports, only: [:index] do
    get :filter, to: :new, on: :collection
  end
  resources :applicants do
    post :email, on: :member
  end

  resources :courses, only: [:create, :index, :new] do
    put :update_multiple, on: :collection
  end

  match '/signout', to: 'sessions#destroy', via: :delete
  match '/signin',  to: 'sessions#new', via: :get
  resource :sessions, only: [:create]

  match '/thanks', to: 'staticpages#thanks', via: :get

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
