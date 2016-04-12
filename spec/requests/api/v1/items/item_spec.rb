require 'rails_helper'

RSpec.describe "GET api/v1/items/:id" do
  it "returns a a specific item" do
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

    get "/api/v1/items/#{item1.id}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(7)
    expect(json_body).to eq({
      id: item1.id,
      name: item1.name,
      :description => "America's past time",
      :unit_price => "10.0",
      :merchant_id => nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end
end
