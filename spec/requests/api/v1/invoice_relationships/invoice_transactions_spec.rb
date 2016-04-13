require 'rails_helper'

RSpec.describe "GET api/v1/invoices/:invoice_id/invoices" do
  it "returns a list of all transactions associated with a given invoice" do
    invoice1 = create(:invoice)
    transaction1 = create(:transaction)
    invoice1.transactions << transaction1

    2.times do
      invoice1.transactions << create(:transaction)
    end

    get "/api/v1/invoices/#{invoice1.id}/transactions"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(3)

    transaction1_json = json_body[0]
    expect(transaction1_json).to eq({
       :id=> transaction1.id,
       :credit_card_number => "4242424242424242",
       :result=>"good",
       :invoice_id=> invoice1.id,
       :created_at=> format_date(transaction1.created_at),
       :updated_at=> format_date(transaction1.updated_at)
       })
  end
end
