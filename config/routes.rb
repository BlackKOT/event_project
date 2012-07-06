ThirdProject::Application.routes.draw do

  resources :page_requests
  post '/like' => 'pict#like', :as => :click_like
  devise_for :users, :controllers => { :sessions => :sessions }
  get '/categories' => 'categories#index', :as =>:categories_list

  get '/categories/:name' => 'categories#show', :as => :categories
  get 'categories/:name/:id' => 'pict#show', :as => :pict
  #map.connect 'categories/:name', :controller => 'categories', :action => 'show'
  get '/comment/all' => 'comment#all', :as => :comment_all
  get '/pict/all' => 'pict#all', :as => :pict_all
  get '/events' => 'events#index', :as => :events_list
  get '/events/:id/like' => 'events#like', :as => :event_like
  get '/events/:id/comment' => 'events#comment', :as => :event_comment
  get '/events/:id/sign_in' => 'events#sign', :as => :event_signin
  get '/events/:id/sign_out' => 'events#sign', :as => :event_signout
  get '/events/:id/navigation' => 'events#navigation', :as => :event_navigation

  post '/comment' => 'pict#comment'
  resources :user
  resources :comments
  resources :categories

  authenticated :user do
      root :to => redirect('/categories')
  end

  unauthenticated :user do
    devise_scope :user do
      get "/" => "devise/sessions#new"
    end
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
