Mejoramigo::Application.routes.draw do
  resources :therapists
  resources :tasks
  resources :causes
  resources :users

  root :to => 'public#register'

  # get 'register' => 'public#register', :as => 'register'
  post 'register' => 'users#create', :as => 'register'
  get 'login_page' => 'public#login_page', :as => 'login_page'

  get 'cause' => 'causes#create', :as => 'create_cause'
  match 'causes/:id/affected' => 'causes#affected', :as => 'cause_affected_name'
  get 'causes/:id/tasks' => 'causes#tasks', :as => 'tasks_cause'
  get 'causes/:id/tasks_list' => 'causes#tasks_list', :as => 'tasks_list_cause' #solo para ajax
  get 'causes/:id/network' => 'networks#current', :as => 'cause_network'
  match 'complete_task/:id' => "tasks#complete_task", :as => "complete_task"

  post "login", :to => "application#login"
  match "logout", :to => "application#logout"

  post "/network/add_friend", :to => "networks#add_friend"

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
  # match ':controller(/:action(/:id))(.:format)'
end
