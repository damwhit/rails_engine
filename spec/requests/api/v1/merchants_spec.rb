require 'rails_helper'

RSpec.describe "GET api/v1/merchants" do
  it "returns a list of all merchants" do
    merchant1 = create(:merchant)
    create(:merchant, name: "David")
    create(:merchant, name: "Michael")

    get "/api/v1/merchants.json"

    expect(response.status).to eq(200)
    expect(json_body[:merchants].count).to eq(3)

    merchant1_json = json_body[:merchants][0]
    expect(merchant1_json).to eq({
      id: merchant1.id,
      name: merchant1.name
      })
  end
end
