require 'rails_helper'

RSpec.describe "GET api/v1/invoices" do
  it "returns a list of all invoices" do
    invoice1 = create(:invoice)
    create(:invoice, status: "David",
                      customer_id: nil,
                      merchant_id: nil,
                      created_at: "2012-03-26 14:53:59 UTC",
                      updated_at: "2012-03-26 14:53:59 UTC")
    create(:invoice, status: "Michael",
                      customer_id: nil,
                      merchant_id: nil,
                      created_at: "2012-03-25 14:53:59 UTC",
                      updated_at: "2012-03-25 14:53:59 UTC")

    get "/api/v1/invoices"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(3)

    invoice1_json = json_body[0]
    expect(invoice1_json).to eq({
      id: invoice1.id,
      status: invoice1.status,
      customer_id: nil,
      merchant_id: nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end
end
