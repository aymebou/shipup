json.extract! shipment_product, :id, :product_id, :shipment_id, :quantity, :created_at, :updated_at
json.url shipment_product_url(shipment_product, format: :json)
