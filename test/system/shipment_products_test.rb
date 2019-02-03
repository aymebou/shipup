require "application_system_test_case"

class ShipmentProductsTest < ApplicationSystemTestCase
  setup do
    @shipment_product = shipment_products(:one)
  end

  test "visiting the index" do
    visit shipment_products_url
    assert_selector "h1", text: "Shipment Products"
  end

  test "creating a Shipment product" do
    visit shipment_products_url
    click_on "New Shipment Product"

    fill_in "Product", with: @shipment_product.product_id
    fill_in "Quantity", with: @shipment_product.quantity
    fill_in "Shipment", with: @shipment_product.shipment_id
    click_on "Create Shipment product"

    assert_text "Shipment product was successfully created"
    click_on "Back"
  end

  test "updating a Shipment product" do
    visit shipment_products_url
    click_on "Edit", match: :first

    fill_in "Product", with: @shipment_product.product_id
    fill_in "Quantity", with: @shipment_product.quantity
    fill_in "Shipment", with: @shipment_product.shipment_id
    click_on "Update Shipment product"

    assert_text "Shipment product was successfully updated"
    click_on "Back"
  end

  test "destroying a Shipment product" do
    visit shipment_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shipment product was successfully destroyed"
  end
end
