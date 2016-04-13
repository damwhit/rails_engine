require 'rails_helper'

RSpec.describe "GET api/v1/transactions/:transaction_id/invoice" do
  it "returns invoice associated with a given transaction" do
    invoice1 = create(:invoice)
    transaction1 = create(:transaction)

    invoice1.transactions << transaction1

    get "/api/v1/transactions/#{transaction1.id}/invoice"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(6)
    expect(json_body).to eq({
       :id=> invoice1.id,
       customer_id: nil,
       :merchant_id => nil,
       :status => "MyString",
       :created_at=> format_date(invoice1.created_at),
       :updated_at=> format_date(invoice1.updated_at)
       })
  end
end
