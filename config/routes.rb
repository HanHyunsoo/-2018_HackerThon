Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :registrations]
  
  devise_scope :user do
    get 'login' => 'front/members/sessions#new', as: :new_user_session #로그인 화면
    post 'login' => 'front/members/sessions#create', as: :user_session #로그인(POST)
    delete '/users/sign_out' => 'front/members/sessions#destroy', as: :destroy_user_session #로그아웃
    get '/users/sign_up' => 'front/members/registers#new', as: :new_user_registration #회원가입
    post 'users' => 'front/members/registers#create', as: :user_registration #회원가입(POST)
  end
  root 'posts#index'
  get 'posts/index'

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
