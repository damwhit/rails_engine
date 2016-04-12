require 'rails_helper'

RSpec.describe "Get api/v1/invoices/random" do
  it "returns a random invoice" do
    create(:invoice)
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

    get "/api/v1/invoices/random"

    expect(response.status).to eq(200)
    expect(json_body.keys).to eq([:id, :customer_id, :merchant_id, :status, :created_at, :updated_at])
  end
end
