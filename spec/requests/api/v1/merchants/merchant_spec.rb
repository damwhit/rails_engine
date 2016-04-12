require 'rails_helper'

RSpec.describe "Get api/v1/merchants/:id" do
  it "returns a specific merchant" do
    merchant1 = create(:merchant)
    create(:merchant, name: "David",
                      created_at: "2012-03-26 14:53:59 UTC",
                      updated_at: "2012-03-26 14:53:59 UTC")
    create(:merchant, name: "Michael",
                      created_at: "2012-03-25 14:53:59 UTC",
                      updated_at: "2012-03-25 14:53:59 UTC")

    get "/api/v1/merchants/#{merchant1.id}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(4)
    expect(json_body).to eq({
      id: merchant1.id,
      name: merchant1.name,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end
end
