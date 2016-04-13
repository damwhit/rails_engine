require 'rails_helper'

RSpec.describe "GET api/v1/invoice_items/:invoice_item_id/item" do
  it "returns item associated with a given invoice_item" do
    item1 = create(:item)
    invoice_item1 = create(:invoice_item)

    item1.invoice_items << invoice_item1

    get "/api/v1/invoice_items/#{invoice_item1.id}/item"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(7)
    expect(json_body).to eq({
       :id=> item1.id,
       :description => "America's past time",
       :merchant_id => nil,
       :name => "baseball",
       :unit_price => "10.0",
       :created_at=> format_date(item1.created_at),
       :updated_at=> format_date(item1.updated_at)
       })
  end
end
