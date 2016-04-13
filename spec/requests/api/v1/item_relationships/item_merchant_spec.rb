require 'rails_helper'

RSpec.describe "GET api/v1/items/:item_id/merchant" do
  it "returns merchant associated with a given item" do
    merchant1 = create(:merchant)
    item1 = create(:item)
    merchant1.items << item1

    get "/api/v1/items/#{item1.id}/merchant"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(4)
    expect(json_body).to eq({
       :id=> merchant1.id,
       name: merchant1.name,
       :created_at=> format_date(merchant1.created_at),
       :updated_at=> format_date(merchant1.updated_at)
       })
  end
end
