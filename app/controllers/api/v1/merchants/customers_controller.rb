module Api
  module V1
    module Merchants
      class CustomersController < ApiController
        def show
          respond_with Merchant.find(params[:id]).favorite_customer
        end

        def index
          respond_with Merchant.find(params[:id]).customers_with_pending_invoices
        end
      end
    end
  end
end
