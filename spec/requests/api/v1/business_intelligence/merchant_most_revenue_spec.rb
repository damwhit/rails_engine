require 'rails_helper'

RSpec.describe "GET api/v1/merchants/most_revenue?quantity=x" do
  before do
    @merchant1 = create(:merchant)
    @merchant2 = create(:merchant, name: "David",
                                   created_at: "2012-03-26 14:53:59 UTC",
                                   updated_at: "2012-03-26 14:53:59 UTC")
    @merchant3 = create(:merchant, name: "Michael",
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
    @merchant1.invoices << invoice1

    invoice2.invoice_items << ii4
    invoice2.invoice_items << ii5
    @merchant2.invoices << invoice2

    invoice3.invoice_items << ii6
    @merchant3.invoices << invoice2
  end

  it "returns a list of a specified quantity of merchants where by most revenue" do

    get "/api/v1/merchants/most_revenue?quantity=2"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(2)

    merchant1_json = json_body[0]
    expect(merchant1_json).to eq({
      id: @merchant1.id,
      name: @merchant1.name,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end
end
