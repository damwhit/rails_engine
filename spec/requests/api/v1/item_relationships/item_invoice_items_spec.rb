require 'rails_helper'

RSpec.describe "GET api/v1/items/:item_id/invoice_items" do
  it "returns invoice items associated with a given item" do

    invoice_item1 = create(:invoice_item)
    item1 = create(:item)

    item1.invoice_items << invoice_item1

    2.times do
      item1.invoice_items << create(:invoice_item)
    end

    get "/api/v1/items/#{item1.id}/invoice_items"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(3)

    invoice_item1_body = json_body[0]
    expect(invoice_item1_body).to eq({
       :id=> invoice_item1.id,
       :unit_price => "10.0",
       :invoice_id => nil,
       :item_id => item1.id,
       :quantity => 1,
       :created_at=> format_date(invoice_item1.created_at),
       :updated_at=> format_date(invoice_item1.updated_at)
       })
  end
end
