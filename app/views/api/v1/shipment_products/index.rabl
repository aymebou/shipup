collection @shipment_products

attributes :id, :shipment_id, :quantity, :created_at, :updated_at

child :products do
  extends "api/v1/products/show"
end
