AutoGomeUtil::Application.routes.draw do
  
  get "run/start"

  get "show/show_tkrp"

  get "show/show_tcrp"
  
  resources :tasks

  resources :tasks do
          resources :testcases, :controller => :tcs do
                  resources :teststeps, :controller => :tcsp
          end
  end

  resources :testobjects
 
  resources :teststeps    
  
  resources :testcases   
 
  match 'tcs/:id' => 'tcs#show'
  
  # get 'tcsp/:id' => 'tcsp#show' 
  # post 'tcsp/:id' => 'tcsp#create'
#   
  # get 'tcsp/new' => 'tcsp#new'
  
  match 'show/tkrp' => 'show#show_tksp'

  match 'show/tcrp/:id' => 'show#show_tcrps'
  
  match 'show/tcrp/:tc_id/counter/:id' => "show#show_steps"
  
  resources :tcsp
  
   resources :runlists
   
   match 'run' => "run#start"
   
   match "check_machine" => "run#check_machine_situ"
   
   match "run_refer/:id" => "run#run_refer_task"
   
   match "run/smoketest" => "run#show_smoketest"
   
    match 'check_smma_situ' => "run#check_smma_situ"
    
    match 'run_pre_smoke' => "run#run_pre_smoke"
    
    match 'run_sit_smoke' => "run#run_sit_smoke"
    
    match 'run_uat_smoke' => "run#run_uat_smoke"
   
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
  root :to => 'tasks#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
