require 'rails_helper'

RSpec.describe "Get api/v1/invoices/:id" do
  it "returns a specific invoice" do
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

    get "/api/v1/invoices/#{invoice1.id}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(6)
    expect(json_body).to eq({
      id: invoice1.id,
      status: invoice1.status,
      customer_id: nil,
      merchant_id: nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end
end
