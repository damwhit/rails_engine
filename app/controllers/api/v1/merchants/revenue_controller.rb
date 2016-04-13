module Api
  module V1
    module Merchants
      class RevenueController < ApiController
        def top_revenue
          invoice = Invoice.joins(:merchant, :invoice_items, :transactions).where('transcations.result' => "success")
          respond_with Merchant.find(params[:id]).invoices
        end
      end
    end
  end
end
