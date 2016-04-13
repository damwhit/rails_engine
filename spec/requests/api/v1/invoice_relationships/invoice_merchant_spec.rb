require 'rails_helper'

RSpec.describe "GET api/v1/invoices/:invoice_id/merchant" do
  it "returns merchant associated with a given invoice" do
    merchant1 = create(:merchant)
    invoice1 = create(:invoice)
    merchant1.invoices << invoice1

    get "/api/v1/invoices/#{invoice1.id}/merchant"

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
