module Api
  module V1
    module Invoices
      class CustomersController < ApiController
        def show
          respond_with Invoice.find(params[:id]).customer
        end
      end
    end
  end
end
