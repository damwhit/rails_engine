module Api
  module V1
    module Items
      class ItemsController < ApiController
        def most_sold
          respond_with Item.best_seller(params[:quantity])
        end
      end
    end
  end
end
