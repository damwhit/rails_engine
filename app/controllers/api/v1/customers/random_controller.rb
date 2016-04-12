module Api
  module V1
    module Customers
      class RandomController < ApiController
        respond_to :json

        def show
          respond_with Customer.order("RANDOM()").first
        end
      end
    end
  end
end
