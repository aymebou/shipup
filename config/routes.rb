Rails.application.routes.draw do
  resources :shipments
  resources :shipment_products
  resources :products
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
