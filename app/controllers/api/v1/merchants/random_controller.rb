module Api
  module V1
    module Merchants
      class RandomController < ApiController
        respond_to :json
        def show
          names = Merchant.pluck(:name)
          respond_with Merchant.find_by(name: names.sample)
        end
      end
    end
  end
end
