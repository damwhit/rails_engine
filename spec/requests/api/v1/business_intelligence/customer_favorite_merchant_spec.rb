require 'rails_helper'

RSpec.describe "GET api/v1/customers/:id/favorite_merchant" do
  before do
    @merchant1 = create(:merchant)
    @merchant2 = create(:merchant, name: "David",
                                   created_at: "2012-03-26 14:53:59 UTC",
                                   updated_at: "2012-03-26 14:53:59 UTC")
    @merchant3 = create(:merchant, name: "Michael",
                                   created_at: "2012-03-25 14:53:59 UTC",
                                   updated_at: "2012-03-25 14:53:59 UTC")
    @customer1 = create(:customer)
    @customer2 = create(:customer)

    invoice1 = create(:invoice)
    invoice2 = create(:invoice)
    invoice3 = create(:invoice)

    ii1 = create(:invoice_item)
    ii2 = create(:invoice_item)
    ii3 = create(:invoice_item)
    @ii6 = create(:invoice_item)

    transaction1 = create(:transaction)
    transaction2 = create(:transaction)
    transaction3 = create(:transaction)

    invoice1.transactions << transaction1
    invoice2.transactions << transaction2
    invoice3.transactions << transaction3

    invoice1.invoice_items << ii1
    invoice1.invoice_items << ii2
    invoice1.invoice_items << ii3
    @merchant1.invoices << invoice1
    @customer1.invoices << invoice1
  end

  it "returns favorite merchant for a certain customer" do
    get "/api/v1/customers/#{@customer1.id}/favorite_merchant"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(4)
    expect(json_body).to eq({
      id: @merchant1.id,
      name: @merchant1.name,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end
end
