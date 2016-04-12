require 'rails_helper'

RSpec.describe "GET api/v1/merchants" do
  it "returns a list of all merchants" do
    merchant1 = create(:merchant)
    create(:merchant, name: "David",
                      created_at: "2012-03-26 14:53:59 UTC",
                      updated_at: "2012-03-26 14:53:59 UTC")
    create(:merchant, name: "Michael",
                      created_at: "2012-03-25 14:53:59 UTC",
                      updated_at: "2012-03-25 14:53:59 UTC")

    get "/api/v1/merchants.json"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(3)

    merchant1_json = json_body[0]
    expect(merchant1_json).to eq({
      id: merchant1.id,
      name: merchant1.name,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end
end
