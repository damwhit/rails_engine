module Api
  module V1
    class MerchantsController < ApiController
      respond_to :json

      def index
        respond_with Merchant.order(updated_at: :asc)
      end

      def show
        respond_with Merchant.find(params[:id])
      end
    end
  end
end
