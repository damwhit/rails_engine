module Api
  module V1
    module Customers
      class TransactionsController < ApiController
        def index
          respond_with Customer.find(params[:id]).transactions
        end
      end
    end
  end
end
