Rails.application.routes.draw do


  resources :items
  resources :carts
  
  get 'mypage/mypage'
  get 'mypage/request'

  resources :orders, except: [:create, :new]
  post 'orders/placeorder' => 'orders#placeorder'
  get 'allorders' => 'orders#all'
  
  get 'cart' => 'carts#index'
  delete 'cart/:id' => 'carts#deletecart'
  post 'cart/:id' => 'carts#addcart'

 resources :boards, only: [:index] do
    resources :articles, only: [:update, :destroy, :create]
  end
  
  scope '/boards/:board_id', except: [:update, :destroy, :create] do
    resources :articles
  end
  
  devise_for :users, :controllers => { :registrations => "registrations" }, :path => "users", :path_names => {:sign_up => "register"}
  
  devise_scope :user do
    get "/users/seller_new" =>"registrations#seller_new"
    get "/users/sign_out" =>"devise/sessions#destroy"
  end
  
  
 

  root 'wenique#index'

  get 'wenique/product'

  get 'wenique/contact'

  get 'wenique/checkout'

  get 'wenique/categories'

  
  get 'wenique/registers_new'
  
  get 'wenique/assign_order/new' => 'wenique#assign_order_new' #지정주문제작서 작성 화면
  
  post 'wenique/assign_order/create' => 'wenique#assign_order_create', as: 'assign_order_create'
  
  get 'wenique/assign_order/show/:id' => 'wenique#assign_order_show' #지정주문제작서 확인
  
  get 'wenique/assign_order/edit/:id' => 'wenique#assign_order_edit'
  
  patch 'wenique/assign_order/update/:id' => 'wenique#assign_order_update', as: 'assign_order_update'
  
  post 'assign_order/:id/create' => 'wenique#assign_order_comment_create', as: 'assign_order_comment_create'
  
  get 'assign_order/:id/make_price' => 'wenique#assign_order_make_price', as: 'assign_order_make_price'
  
  post 'assign_order/:id/make_price/create' => 'wenique#assign_order_make_price_create', as: 'price_create'
  
  get '/users/search' => 'wenique#user_search', as: 'search_users'
  
  get 'wenique/unassign_order'  #미지정주문제작 화면
  
  get 'wenique/handicrafts'
  
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
