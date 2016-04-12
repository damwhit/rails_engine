require 'rails_helper'

RSpec.describe "Get api/v1/customers/random" do
  it "returns a random customer" do
    create(:customer)
    create(:customer, first_name: "David",
                      last_name: "Whitaker",
                      created_at: "2012-03-26 14:53:59 UTC",
                      updated_at: "2012-03-26 14:53:59 UTC")
    create(:customer, first_name: "Michael",
                      last_name: "Whitaker",
                      created_at: "2012-03-25 14:53:59 UTC",
                      updated_at: "2012-03-25 14:53:59 UTC")

    get "/api/v1/customers/random"

    expect(response.status).to eq(200)
    expect(json_body.keys).to eq([:id, :first_name, :last_name, :created_at, :updated_at])
  end
end
