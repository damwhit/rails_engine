require 'rails_helper'

RSpec.describe "GET api/v1/merchants/:merchant_id/items" do
  it "returns a list of all items for a given merchant" do
    merchant1 = create(:merchant)
    item1 = create(:item)
    merchant1.items << item1
    2.times do
      merchant1.items << create(:item)
    end

    get "/api/v1/merchants/#{merchant1.id}/items"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(3)

    item1_json = json_body[0]
    expect(item1_json).to eq({:id=> item1.id,
       :name=>"baseball",
       :description=>"America's past time",
       :unit_price=>"10.0",
       :merchant_id=> merchant1.id,
       :created_at=> format_date(item1.created_at),
       :updated_at=> format_date(item1.updated_at)
       })
  end
end
