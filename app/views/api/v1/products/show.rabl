object @product

attributes :id, :sku, :description, :created_at, :updated_at

child :company do
  extends "api/v1/companies/show"
end
