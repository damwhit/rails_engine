module Api
  module V1
    module InvoiceItems
      class InvoicesController < ApiController
        def show
          respond_with InvoiceItem.find(params[:id]).invoice
        end
      end
    end
  end
end
