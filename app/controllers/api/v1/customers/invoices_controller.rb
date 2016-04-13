module Api
  module V1
    module Customers
      class InvoicesController < ApiController
        def index
          respond_with Customer.find(params[:id]).invoices
        end
      end
    end
  end
end
