require 'rails_helper'

RSpec.describe "GET api/v1/transactions/:id" do
  it "returns a specific transaction" do
    transaction1 = create(:transaction)
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

    get "/api/v1/transactions/#{transaction1.id}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(6)

    expect(json_body).to eq({
      id: transaction1.id,
      credit_card_number: transaction1.credit_card_number,
      invoice_id: nil,
      result: "success",
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end
end
