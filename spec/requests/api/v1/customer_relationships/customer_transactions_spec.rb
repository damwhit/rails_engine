require 'rails_helper'

RSpec.describe "GET api/v1/customers/:customer_id/transactions" do
  it "returns a list of all transactions associated with a given customer" do
    customer1 = create(:customer)
    invoice1 = create(:invoice)

    customer1.invoices << invoice1
    transaction1 = create(:transaction)

    invoice1.transactions << transaction1

    2.times do
      invoice1.transactions << create(:transaction)
    end

    get "/api/v1/customers/#{customer1.id}/transactions"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(3)

    transaction1_json = json_body[0]
    expect(transaction1_json).to eq({
       :id=> transaction1.id,
       :result=>"good",
       :credit_card_number => "4242424242424242",
       :invoice_id=> invoice1.id,
       :created_at=> format_date(transaction1.created_at),
       :updated_at=> format_date(transaction1.updated_at)
       })
  end
end
