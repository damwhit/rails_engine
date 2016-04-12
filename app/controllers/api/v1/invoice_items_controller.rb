module Api
  module V1
    class InvoiceItemsController < ApiController
      def model
        InvoiceItem
      end

      private
        def model_params
          [:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at]
        end
    end
  end
end
