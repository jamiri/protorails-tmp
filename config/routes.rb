Protorails::Application.routes.draw do

  root :to => 'home#index', :as => 'home'

  match '/lesson/:id/terms', :to => 'glossary#lookup_lesson_terms', :as => :lesson_terms
  match '/glossary/:term', :to => 'glossary#lookup_term', :as => :lookup_term

  match '/lesson/:lesson_id/microblog/create', :to => 'microblog#create', :as => :lookup_term
  match '/lesson/:lesson_id/microblogs/:page', :to => 'microblog#get', :as => :get_micrblog

  match 'feedback' => 'home#feedback'
  match 'suggestion' => 'home#suggestion'

  match 'user/signup' => 'user#signup'
  match 'user/signin' => 'user#signin'
  match 'user/signout' => 'user#signout'

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
