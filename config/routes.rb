Rails.application.routes.draw do
  
  resources :boards, only: [:index] do
    resources :articles, only: [:update, :destroy]
  end
  
  
  scope '/boards/:board_id', except: [:update, :destroy] do
    resources :articles
  end
  
  devise_for :users, :controllers => { :registrations => "registrations" }, :path => "users", :path_names => {:sign_up => "register"}
  
  devise_scope :user do
    get "/users/seller_new" =>"registrations#seller_new"
    get "/users/sign_out" =>"devise/sessions#destroy"
  end
  
  root 'posts#index'
  get 'posts/registers_new'
  get 'posts/index'
  get 'posts/assign_order'  #지정주문제작 화면
  get 'posts/unassign_order'  #미지정주문제작 화면
  get 'posts/maker'  #수공업자 소개 화면
  get 'posts/my_page' #마이페이지
  get 'posts/seller_page' #수공업자 개인 페이지
  get 'posts/user_board' #자유게시판
  get 'posts/notice' #공지사항
  
  # get 'boards/:board_id/articles' => 'articles#index'

  # get 'boards/:board_id/articles/new', to: 'articles#new', as: 'articles'

  

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
