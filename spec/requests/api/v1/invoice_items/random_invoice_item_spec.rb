require 'rails_helper'

RSpec.describe "Get api/v1/invoice_items/random" do
  it "returns a random invoice item" do
    create(:invoice_item)
    create(:invoice_item, quantity: 10,
                      unit_price: "10.00",
                      invoice_id: nil,
                      item_id: nil,
                      created_at: "2012-03-26 14:53:59 UTC",
                      updated_at: "2012-03-26 14:53:59 UTC")
    create(:invoice_item, quantity: 11,
                      unit_price: "10.00",
                      invoice_id: nil,
                      item_id: nil,
                      created_at: "2012-03-25 14:53:59 UTC",
                      updated_at: "2012-03-25 14:53:59 UTC")

    get "/api/v1/invoice_items/random"

    expect(response.status).to eq(200)
    expect(json_body.keys).to eq([:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at])
  end
end
