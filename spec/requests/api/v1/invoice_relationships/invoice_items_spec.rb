require 'rails_helper'

RSpec.describe "GET api/v1/invoices/:invoice_id/items" do
  it "returns a list of all items associated with a given invoice" do
    invoice1 = create(:invoice)
    invoice_item1 = create(:invoice_item)
    item1 = create(:item)
    item2 = create(:item)
    item3 = create(:item)

    invoice1.invoice_items << invoice_item1

    item1.invoice_items << invoice_item1
    item2.invoice_items << invoice_item1
    item3.invoice_items << invoice_item1

    invoice1.invoice_items << invoice_item1

    get "/api/v1/invoices/#{invoice1.id}/items"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(1)

    item1_json = json_body[0]
    expect(item1_json).to eq({
       :id=> item3.id,
       description: item3.description,
       merchant_id: nil,
       name: item3.name,
       :unit_price => "10.0",
       :created_at=> format_date(item3.created_at),
       :updated_at=> format_date(item3.updated_at)
       })
  end
end
