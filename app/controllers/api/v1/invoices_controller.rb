module Api
  module V1
    class InvoicesController < ApiController
      def model
        Invoice
      end

      private
        def model_params
          [:id, :customer_id, :merchant_id, :status, :created_at, :updated_at]
        end
    end
  end
end
