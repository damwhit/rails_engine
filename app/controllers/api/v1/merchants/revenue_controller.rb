module Api
  module V1
    module Merchants
      class RevenueController < ApiController
        def most_revenue
          # invoice = Invoice.joins(:merchant, :invoice_items, :transactions).where('transcations.result' => "success")
          # respond_with Merchant.find(params[:id]).invoices
          respond_with Merchant.top_revenue(params[:quantity])
        end

        def total_revenue
          respond_with Invoice.revenue_by_date(params[:date]), serializer: TotalRevenueByDateSerializer
        end

        def single_merchant_revenue
          if params[:date]
            respond_with Merchant.revenue_by_date(params[:id], params[:date]), serializer: MerchantTotalRevenueSerializer
          else
            respond_with Merchant.revenue(params[:id]), serializer: MerchantTotalRevenueSerializer
          end
        end
      end
    end
  end
end
