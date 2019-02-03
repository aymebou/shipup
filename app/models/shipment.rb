class Shipment < ApplicationRecord
  belongs_to :company

  def get_products
    products = ShipmentProduct.includes(:product).where(:shipment_id => self[:id]).map { |shipment_product| nest_product_and_keep_quantity(shipment_product) }
    return products
  end

  private

  def nest_product_and_keep_quantity (shipment_product)
    return shipment_product.product.as_json.merge(:quantity => shipment_product.quantity )
  end
end
