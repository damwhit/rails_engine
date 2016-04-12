require 'rails_helper'

RSpec.describe "Get api/v1/merchants/:id" do
  it "returns a specific merchant" do
    merchant1 = create(:merchant)
    create(:merchant, name: "David")
    create(:merchant, name: "Michael")

    get "/api/v1/merchants/#{merchant1.id}.json"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(1)
    expect(json_body[:merchant]).to eq({
      id: merchant1.id,
      name: merchant1.name
      })
  end
end
