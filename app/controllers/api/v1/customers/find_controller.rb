module Api
  module V1
    module Customers
      class FindController < ApiController
        def show
          respond_with Customer.find_by(customer_params)
        end

        def index
          respond_with Customer.where(customer_params)
        end

        private

          def customer_params
            params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
          end
      end
    end
  end
end
