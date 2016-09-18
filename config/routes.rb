Rails.application.routes.draw do
  get 'userdetail/userdetail'

  get 'select/select'

  get 'theme3/page3'

  get 'theme2/page2'

  get 'blogcomment/blogcomment'

  get 'blog/blog'

  get 'proname/proname'

  get 'theme/page'

  get 'submenu/submenu'

  mount Ckeditor::Engine => '/ckeditor'
  get 'index/index'

  get 'public/view'

  get 'login/form'

  get 'feedback/feedback'

  get 'contact/contact'

  get 'banner/banner'

  get 'background/background'

  get 'slider/slider'

  get 'page/page'

  get 'sub_menu/sub_menu'

  get 'menu/menu'

  get 'user_detail/user_detail'

  get 'user/user'

  get 'admin/view'


  match 'index' => "public#view" , via:[:get,:post]
  match 'login' => "public#login" , via:[:get,:post]
  match 'admin' => "user#view" , via:[:get,:post]
  match 'newuser' => "public#signup" , via:[:get,:post]
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'public#view'

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
  get':controller(/:action(/:id(.:format)))'=>'foo#matchers'
  post':controller(/:action(/:id(.:format)))'=>'foo#matchers'
end
