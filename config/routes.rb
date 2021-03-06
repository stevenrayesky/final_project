Rails.application.routes.draw do

devise_for :users, :controllers => { registrations: 'registrations' }

get 'load/trees/:tree_id/familymembers/' => 'familymembers#json_return', defaults: {format: 'json'}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  devise_scope :user do  
    root 'devise/sessions#new'
  end
  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :users do
    resources :trees 
  end
  resources :trees do
      resources :familymembers
    end

    get '/trees/:tree_id/familymembers/:id/new_child' => 'familymembers#new_child', as: :new_child
    post '/trees/:tree_id/familymembers/create_child' => 'familymembers#create_child', as: :create_child

    get '/trees/:tree_id/familymembers/:id/new_parent' => 'familymembers#new_parent', as: :new_parent
    post '/trees/:tree_id/familymembers/create_parent' => 'familymembers#create_parent', as: :create_parent

    get '/trees/:tree_id/familymembers/:id/new_partner' => 'familymembers#new_partner', as: :new_partner
    post '/trees/:tree_id/familymembers/create_partner' => 'familymembers#create_partner', as: :create_partner

    get '/trees/:tree_id/familymembers' => 'familymembers#gon'
    # PUT '/users/:user_id/trees/:id' => 'trees#put'
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
