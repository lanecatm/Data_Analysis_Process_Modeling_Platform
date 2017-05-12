Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  get 'home/test'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  resources :workflow_informations do
      resources :workflow_privileges
      resources :workflow_comments
  end
  post 'search/', to: 'search#search'
  get 'search/', to: 'search#show'

  resources :process do
      get 'execute/', to: 'process#show_execute'
      post 'execute/', to: 'process#execute'
      post 'copy/', to: 'process#copy'
  end
  #post "process", to: 'process#create'
  #get 'process/train/', to: 'process#show_train'
  post 'process/train/', to: 'process#train'
  #get 'process/execute/:id/', to: 'process#show_execute'
#  get 'process/refresh/', to: 'process#refresh_info'
  post 'process/upload/', to: 'process#upload'
  post 'process/download/', to: 'process#download'

  
  get 'history/model/', to: 'history#show_model'
  get 'history/use_case/', to: 'history#show_use_case'
  get 'history/running_record/', to: 'history#show_running_record'

  get 'preprocess/data/', to: 'data_pre_processing#show'
  post 'preprocess/upload/', to: 'data_pre_processing#upload'


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
