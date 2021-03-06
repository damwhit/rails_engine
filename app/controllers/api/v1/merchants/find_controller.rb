module Api
  module V1
    module Merchants
      class FindController < ApiController

        def show
          respond_with Merchant.find_by(merchant_params)
        end

        def index
          respond_with Merchant.where(merchant_params)
        end

        private

          def merchant_params
            params.permit(:id, :name, :created_at, :updated_at)
          end
      end
    end
  end
end
