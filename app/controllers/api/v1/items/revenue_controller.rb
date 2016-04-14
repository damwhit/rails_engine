module Api
  module V1
    module Items
      class RevenueController < ApiController
        def most_revenue
          respond_with Item.top_revenue(params[:quantity])
        end
      end
    end
  end
end
