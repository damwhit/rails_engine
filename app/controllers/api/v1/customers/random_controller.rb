module Api
  module V1
    module Customers
      class RandomController < ApiController
        def show
          respond_with Customer.order("RANDOM()").first
        end
      end
    end
  end
end
