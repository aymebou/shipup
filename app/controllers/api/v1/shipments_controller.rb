module Api
  module V1
    class ShipmentsController < ApplicationController
      before_action :set_shipment, only: [:show, :edit, :update, :destroy]

      # GET /shipments
      # GET /shipments.json
      def index
        if params[:company_id] == nil
          render status: 422, json: {errors: ['company_id is required']}
        else
          @shipments = filter(params)
          @shipments = sort_accordingly_to_params(params, @shipments)
          @shipments = make_pagination(params, @shipments)
          render 'index'
        end
      end

      # GET /shipments/1
      # GET /shipments/1.json
      def show
      end

      # GET /shipments/new
      def new
        @shipment = Shipment.new
      end

      # GET /shipments/1/edit
      def edit
      end

      # POST /shipments
      # POST /shipments.json
      def create
        @shipment = Shipment.new(shipment_params)

        respond_to do |format|
          if @shipment.save
            format.html { redirect_to @shipment, notice: 'Shipment was successfully created.' }
            format.json { render :show, status: :created, location: @shipment }
          else
            format.html { render :new }
            format.json { render json: @shipment.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /shipments/1
      # PATCH/PUT /shipments/1.json
      def update
        respond_to do |format|
          if @shipment.update(shipment_params)
            format.html { redirect_to @shipment, notice: 'Shipment was successfully updated.' }
            format.json { render :show, status: :ok, location: @shipment }
          else
            format.html { render :edit }
            format.json { render json: @shipment.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /shipments/1
      # DELETE /shipments/1.json
      def destroy
        @shipment.destroy
        respond_to do |format|
          format.html { redirect_to shipments_url, notice: 'Shipment was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_shipment
          @shipment = Shipment.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def shipment_params
          params.require(:shipment).permit(:name, :company_id, :international_transportation_mode, :international_departure_date)
        end

        def make_pagination(params, shipments)
          element_per_page = (params[:per] || 4).to_i
          page = (params[:page] || 1).to_i
          return shipments.offset(element_per_page * (page - 1)).limit(element_per_page)
        end

        def filter (shipment_params)
          shipments = Shipment.all
          if shipment_params[:company_id]
            shipments = shipments.where(:company_id => shipment_params[:company_id])
          end
          if shipment_params[:international_transportation_mode]
            shipments = shipments.where(:international_transportation_mode => shipment_params[:international_transportation_mode])
          end
          return shipments
        end

        def sort_accordingly_to_params(sorting, shipments)
          sorting_column = sorting[:sort] || 'id'
          sorting_direction = sorting[:direction] || 'ASC'
          return shipments.order(sorting_column +' '+ sorting_direction)
        end
    end
  end
end
