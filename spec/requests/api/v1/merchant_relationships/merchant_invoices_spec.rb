require 'rails_helper'

RSpec.describe "GET api/v1/merchants/:merchant_id/invoices" do
  it "returns a list of all invoices associated with a given merchant" do
    merchant1 = create(:merchant)
    invoice1 = create(:invoice)
    merchant1.invoices << invoice1

    2.times do
      merchant1.invoices << create(:invoice)
    end

    get "/api/v1/merchants/#{merchant1.id}/invoices"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(3)

    invoice1_json = json_body[0]
    expect(invoice1_json).to eq({
       :id=> invoice1.id,
       :status=>"MyString",
       :customer_id=>nil,
       :merchant_id=> merchant1.id,
       :created_at=> format_date(invoice1.created_at),
       :updated_at=> format_date(invoice1.updated_at)
       })
  end
end
