module Api
  module V1
    module Merchants
      class RandomController < ApiController
        def show
          # names = Merchant.pluck(:name)
          # respond_with Merchant.find_by(name: names.sample)
          # Merchant.find(rand(1..Merchant.count))
          # respond_with Merchant.offset(rand(1..Merchant.count)).first
          respond_with Merchant.order("RANDOM()").first
        end
      end
    end
  end
end
