module Api
  module V1
    module Merchants
      class ItemsController < ApiController
        def index
          respond_with Merchant.find(params[:id]).items
        end

        def most_items
          respond_with Merchant.top_items(params[:quantity])
        end
      end
    end
  end
end
