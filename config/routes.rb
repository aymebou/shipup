Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :api , path: '/api/' , defaults: {format: 'json'} do
        namespace :v1 do
            resources :shipments
            resources :shipment_products
            resources :products
            resources :companies
        end
  end

end
