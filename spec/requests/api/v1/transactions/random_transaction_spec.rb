require 'rails_helper'

RSpec.describe "Get api/v1/transactions/random" do
  it "returns a random transaction" do
    create(:transaction)
    create(:transaction, credit_card_number: "424242424242424242",
                      invoice_id: nil,
                      result: "guud",
                      created_at: "2012-03-26 14:53:59 UTC",
                      updated_at: "2012-03-26 14:53:59 UTC")
    create(:transaction, credit_card_number: "424242424242424242",
                      invoice_id: nil,
                      result: "guud",
                      created_at: "2012-03-25 14:53:59 UTC",
                      updated_at: "2012-03-25 14:53:59 UTC")

    get "/api/v1/transactions/random"

    expect(response.status).to eq(200)
    expect(json_body.keys).to eq([:id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at])
  end
end
