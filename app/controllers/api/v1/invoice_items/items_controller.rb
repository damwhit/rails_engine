module Api
  module V1
    module InvoiceItems
      class ItemsController < ApiController
        def show
          respond_with InvoiceItem.find(params[:id]).item
        end
      end
    end
  end
end
