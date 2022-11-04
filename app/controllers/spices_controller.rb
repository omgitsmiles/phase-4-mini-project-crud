class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index
        spices = Spice.all
        render json: spices
    end

    # def show
    #     spice = find_spice
    #     render json: spice
    # end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: 201
    end

    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice, status: 200
    end

    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
    
    def find_spice
        Spice.find(params[:id])
    end
    
    def render_not_found
        render json: { error: "Spice MILANGE not found" }, status: :not_found
    end

end
