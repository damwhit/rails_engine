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
      respond_with model.find_by(permitted_params)
    end

    def find_all
      respond_with model.where(permitted_params)
    end

    def random
      respond_with model.order("RANDOM()").first
    end

    def permitted_params
      model_attributes = model.attribute_names.map { |attr| attr.to_sym }
      params.permit(model_attributes)
    end
  end
end
