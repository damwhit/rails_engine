require 'rails_helper'

RSpec.describe "Get api/v1/invoice_items/:id" do
  it "returns a specific invoice_item" do
    invoice_item1 = create(:invoice_item)
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

    get "/api/v1/invoice_items/#{invoice_item1.id}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(7)
    expect(json_body).to eq({
      id: invoice_item1.id,
      quantity: invoice_item1.quantity,
      unit_price: "10.0",
      invoice_id: nil,
      item_id: nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end
end
