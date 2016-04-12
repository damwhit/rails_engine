require 'rails_helper'

RSpec.describe "Get api/v1/merchants/random" do
  it "returns a random merchant" do
    create(:merchant)
    create(:merchant, name: "David",
                      created_at: "2012-03-26 14:53:59 UTC",
                      updated_at: "2012-03-26 14:53:59 UTC")
    create(:merchant, name: "Michael",
                      created_at: "2012-03-25 14:53:59 UTC",
                      updated_at: "2012-03-25 14:53:59 UTC")

    get "/api/v1/merchants/random"

    expect(response.status).to eq(200)
    expect(json_body.keys).to eq([:created_at, :id, :name, :updated_at])
  end
end
