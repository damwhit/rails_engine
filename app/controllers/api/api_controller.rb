module Api
  class ApiController < ApplicationController
    protect_from_forgery with: :null_session
    respond_to :json

    def index
      respond_with model.all
    end

    def show
      respond_with model.find(params[:id])
    end

    def find
      respond_with model.find_by(strong_params)
    end

    def strong_params
      params.permit(:id, :name, :description, :unit_price, :created_at, :updated_at)
    end
  end
end
