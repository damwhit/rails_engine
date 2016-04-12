require 'rails_helper'

RSpec.describe "GET api/v1/items" do
  it "returns a list of all items" do
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

    get "/api/v1/items"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(3)

    item1_json = json_body[0]
    expect(item1_json).to eq({
      id: item1.id,
      name: item1.name,
      :description => "America's past time",
      :unit_price => 1000,
      :merchant_id => nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end
end
