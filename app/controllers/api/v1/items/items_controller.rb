module Api
  module V1
    module Items
      class ItemsController < ApiController
        def most_sold
          respond_with Item.best_seller(params[:quantity])
        end

        def best_day
          respond_with Item.find(params[:id]).best_selling_date, serializer: BestDaySerializer
        end
      end
    end
  end
end
