Rails.application.routes.draw do
  get 'hotels/add'
  get 'hotels/edit'
  get 'hotels/update'
  get 'hotels/delete'
  get 'hotels/sign_in'
  get 'hotels/sign_out'
  get 'hotels/rooms'
  get 'hotels/all_rooms'
  get 'hotels/change_password'

  post 'hotels/update_rooms'
  post 'hotels/check_user'
  post 'hotels/rooms'
  post 'hotels/all_rooms'
  post 'hotels/sign_out'
  post 'hotels/get_rooms'
  post 'hotels/update_password'

  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/edit'
  get 'bookings/update'
  get 'bookings/delete'
  get 'bookings/report'
  post 'bookings/get_prices'
  post 'email' => 'bookings#contact_email' 

  get 'bookings_airlines/new'
  post 'bookings_airlines/create'
  post 'bookings_airlines/get_prices'

  post 'bookings/create'
  post 'bookings/process_report'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'bookings#index'

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
