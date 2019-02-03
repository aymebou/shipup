module Api
  module V1
    class ShipmentProductsController < ApplicationController
      before_action :set_shipment_product, only: [:show, :edit, :update, :destroy]

      # GET /shipment_products
      # GET /shipment_products.json
      def index
        @shipment_products = ShipmentProduct.all
      end

      # GET /shipment_products/1
      # GET /shipment_products/1.json
      def show
      end

      # GET /shipment_products/new
      def new
        @shipment_product = ShipmentProduct.new
      end

      # GET /shipment_products/1/edit
      def edit
      end

      # POST /shipment_products
      # POST /shipment_products.json
      def create
        @shipment_product = ShipmentProduct.new(shipment_product_params)

        respond_to do |format|
          if @shipment_product.save
            format.html { redirect_to @shipment_product, notice: 'Shipment product was successfully created.' }
            format.json { render :show, status: :created, location: @shipment_product }
          else
            format.html { render :new }
            format.json { render json: @shipment_product.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /shipment_products/1
      # PATCH/PUT /shipment_products/1.json
      def update
        respond_to do |format|
          if @shipment_product.update(shipment_product_params)
            format.html { redirect_to @shipment_product, notice: 'Shipment product was successfully updated.' }
            format.json { render :show, status: :ok, location: @shipment_product }
          else
            format.html { render :edit }
            format.json { render json: @shipment_product.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /shipment_products/1
      # DELETE /shipment_products/1.json
      def destroy
        @shipment_product.destroy
        respond_to do |format|
          format.html { redirect_to shipment_products_url, notice: 'Shipment product was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_shipment_product
          @shipment_product = ShipmentProduct.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def shipment_product_params
          params.require(:shipment_product).permit(:product_id, :shipment_id, :quantity)
        end
    end
  end
end
