module Api
  module V1
    class ItemsController < ApiController
      include ApiBaseController

      def model
        Item
      end

      private
        def model_params
          [:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at]
        end
    end
  end
end
