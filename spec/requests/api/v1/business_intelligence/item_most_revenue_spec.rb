require 'rails_helper'

RSpec.describe "GET api/v1/items/most_revenue?quantity=x" do
  before do
    @item1 = create(:item)
    @item2 = create(:item, name: "David",
                                   created_at: "2012-03-26 14:53:59 UTC",
                                   updated_at: "2012-03-26 14:53:59 UTC")
    @item3 = create(:item, name: "Michael",
                                   created_at: "2012-03-25 14:53:59 UTC",
                                   updated_at: "2012-03-25 14:53:59 UTC")

    invoice1 = create(:invoice)
    invoice2 = create(:invoice)
    invoice3 = create(:invoice)

    transaction1 = create(:transaction)
    transaction2 = create(:transaction)
    transaction3 = create(:transaction)

    invoice1.transactions << transaction1
    invoice2.transactions << transaction2
    invoice3.transactions << transaction3

    ii1 = create(:invoice_item)
    ii2 = create(:invoice_item)
    ii3 = create(:invoice_item)
    ii4 = create(:invoice_item)
    ii5 = create(:invoice_item)
    ii6 = create(:invoice_item)

    invoice1.invoice_items << ii1
    invoice1.invoice_items << ii2
    invoice1.invoice_items << ii3
    @item1.invoice_items << ii1
    @item1.invoice_items << ii2
    @item1.invoice_items << ii3

    invoice2.invoice_items << ii4
    invoice2.invoice_items << ii5
    @item2.invoice_items << ii4
    @item2.invoice_items << ii5

    invoice3.invoice_items << ii6
    @item3.invoice_items << ii6
  end

  it "returns a list of a specified quantity of items where by most revenue" do

    get "/api/v1/items/most_revenue?quantity=2"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(2)

    item1_json = json_body[0]
    expect(item1_json).to eq({
      id: @item1.id,
      name: @item1.name,
      :description => "America's past time",
      :merchant_id => nil,
      :unit_price => "10.0",
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end
end
