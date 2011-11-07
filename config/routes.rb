CloudSchoolComputing::Application.routes.draw do
  resources :packages

  resources :schools do
    resources :groups do 
      resources :group_students, :except => [:edit,:update,:show] do
        resources :grades
      end
      resources :activities do
        resources :grades
      end
    end

    resources :users
    get 'teachers' => "users#teachers"
    resources :students
    resources :subjects

    match '/users/page/:page_id' => 'users#more'
    match '/subjects/page/:page_id' => 'subjects#more'
    match '/students/page/:page_id' => 'students#more'
  end

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  resources :sessions, :only => [:create, :destroy]

  get '/users' => 'users#admin_index'
  get 'users/:id/edit' => 'users#admin_edit', :as => 'edit_user'
  get 'users/:id' => 'users#admin_show', :as => 'user'
  put 'users/:id' => 'users#admin_update'
  delete 'users/:id' => 'users#admin_destroy'

  root :to => "main#index"

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
