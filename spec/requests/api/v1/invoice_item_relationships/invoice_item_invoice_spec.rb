require 'rails_helper'

RSpec.describe "GET api/v1/invoice_items/:invoice_item_id/invoice" do
  it "returns invoice associated with a given invoice_item" do
    invoice1 = create(:invoice)
    invoice_item1 = create(:invoice_item)

    invoice1.invoice_items << invoice_item1

    get "/api/v1/invoice_items/#{invoice_item1.id}/invoice"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(6)
    expect(json_body).to eq({
       :id=> invoice1.id,
       customer_id: nil,
       :merchant_id => nil,
       :status => "MyString",
       :created_at=> format_date(invoice1.created_at),
       :updated_at=> format_date(invoice1.updated_at)
       })
  end
end
