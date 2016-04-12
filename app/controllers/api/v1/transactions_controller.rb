module Api
  module V1
    class TransactionsController < ApiController
      def model
        Transaction
      end

      private
        def model_params
        [:id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at]
        end
    end
  end
end
