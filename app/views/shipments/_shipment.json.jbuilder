json.extract! shipment, :id, :name, :company_id, :international_transportation_mode, :international_departure_date, :created_at, :updated_at
json.url shipment_url(shipment, format: :json)
