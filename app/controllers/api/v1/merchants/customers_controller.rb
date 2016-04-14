module Api
  module V1
    module Merchants
      class CustomersController < ApiController
        def show
          respond_with Merchant.find(params[:id]).favorite_customer
        end
      end
    end
  end
end
