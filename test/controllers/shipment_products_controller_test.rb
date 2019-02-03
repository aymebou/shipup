require 'test_helper'

class ShipmentProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipment_product = shipment_products(:one)
  end

  test "should get index" do
    get shipment_products_url
    assert_response :success
  end

  test "should get new" do
    get new_shipment_product_url
    assert_response :success
  end

  test "should create shipment_product" do
    assert_difference('ShipmentProduct.count') do
      post shipment_products_url, params: { shipment_product: { product_id: @shipment_product.product_id, quantity: @shipment_product.quantity, shipment_id: @shipment_product.shipment_id } }
    end

    assert_redirected_to shipment_product_url(ShipmentProduct.last)
  end

  test "should show shipment_product" do
    get shipment_product_url(@shipment_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_shipment_product_url(@shipment_product)
    assert_response :success
  end

  test "should update shipment_product" do
    patch shipment_product_url(@shipment_product), params: { shipment_product: { product_id: @shipment_product.product_id, quantity: @shipment_product.quantity, shipment_id: @shipment_product.shipment_id } }
    assert_redirected_to shipment_product_url(@shipment_product)
  end

  test "should destroy shipment_product" do
    assert_difference('ShipmentProduct.count', -1) do
      delete shipment_product_url(@shipment_product)
    end

    assert_redirected_to shipment_products_url
  end
end
