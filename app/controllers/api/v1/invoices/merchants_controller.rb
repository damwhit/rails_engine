module Api
  module V1
    module Invoices
      class MerchantsController < ApiController
        def show
          respond_with Invoice.find(params[:id]).merchant
        end
      end
    end
  end
end
