require 'rails_helper'

RSpec.describe "GET api/v1/invoices/:invoice_id/invoice_items" do
  it "returns a list of all invoice items associated with a given invoice" do
    invoice1 = create(:invoice)
    invoice_item1 = create(:invoice_item)
    invoice1.invoice_items << invoice_item1

    2.times do
      invoice1.invoice_items << create(:invoice_item)
    end

    get "/api/v1/invoices/#{invoice1.id}/invoice_items"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(3)

    invoice_item1_json = json_body[0]
    expect(invoice_item1_json).to eq({
       :id=> invoice_item1.id,
       :invoice_id=> invoice1.id,
       :item_id => nil,
       :quantity => 1,
       :unit_price => "10.0",
       :created_at=> format_date(invoice_item1.created_at),
       :updated_at=> format_date(invoice_item1.updated_at)
       })
  end
end
