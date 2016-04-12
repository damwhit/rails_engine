require 'rails_helper'

RSpec.describe "Get api/v1/items/random" do
  it "returns a random item" do
    item1 = create(:item)
    create(:item, name: "basketball",
                  description: "sooo kewl",
                  unit_price: 10000,
                      created_at: "2012-03-26 14:53:59 UTC",
                      updated_at: "2012-03-26 14:53:59 UTC")
    create(:item, name: "Football",
                  description: "sooo kewl",
                  unit_price: 10000,
                      created_at: "2012-03-25 14:53:59 UTC",
                      updated_at: "2012-03-25 14:53:59 UTC")

    get "/api/v1/items/random"

    expect(response.status).to eq(200)
    expect(json_body.keys).to eq([:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at])
  end
end
