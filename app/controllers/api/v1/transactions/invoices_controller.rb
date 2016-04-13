module Api
  module V1
    module Transactions
      class InvoicesController < ApiController
        def show
          respond_with Transaction.find(params[:id]).invoice
        end
      end
    end
  end
end
