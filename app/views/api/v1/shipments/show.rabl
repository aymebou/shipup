object @shipments

attributes :id, :name, :international_transportation_mode, :international_departure_date, :created_at, :updated_at

child :company do
  extends "api/v1/companies/show"
end

node :products do |shipment|
  shipment.get_products() 
end
