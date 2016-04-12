require 'rails_helper'

RSpec.describe "Get api/v1/transactions/find_all?key=value" do
  before do
    @transaction1 = create(:transaction)
    @transaction2 = create(:transaction, credit_card_number: "424242424242424242",
                        invoice_id: nil,
                        result: "guud",
                        created_at: "2012-03-26 14:53:59 UTC",
                        updated_at: "2012-03-26 14:53:59 UTC")
    create(:transaction, credit_card_number: "424242424242424242",
                        invoice_id: nil,
                        result: "guud",
                        created_at: "2012-03-26 14:53:59 UTC",
                        updated_at: "2012-03-26 14:53:59 UTC")
    @transaction3 = create(:transaction, credit_card_number: "424242424242424242",
                        invoice_id: nil,
                        result: "guud",
                        created_at: "2012-03-25 14:53:59 UTC",
                        updated_at: "2012-03-25 14:53:59 UTC")
    create(:transaction, credit_card_number: "424242424242424242",
                        invoice_id: nil,
                        result: "guud",
                        created_at: "2012-03-25 14:53:59 UTC",
                        updated_at: "2012-03-25 14:53:59 UTC")
  end

  it "returns all transactions where id is the same" do

    get "/api/v1/transactions/find_all?id=#{@transaction1.id}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(1)

    transaction1_json = json_body[0]
    expect(transaction1_json).to eq({
      id: @transaction1.id,
      credit_card_number: @transaction1.credit_card_number,
      invoice_id: nil,
      result: "good",
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns all transactions where credit_card_number is the same" do

    get "/api/v1/transactions/find_all?credit_card_number=#{@transaction1.credit_card_number}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(1)

    transaction1_json = json_body[0]
    expect(transaction1_json).to eq({
      id: @transaction1.id,
      credit_card_number: @transaction1.credit_card_number,
      invoice_id: nil,
      result: "good",
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns all transactions where result is the same" do

    get "/api/v1/transactions/find_all?result=#{@transaction1.result}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(1)

    transaction1_json = json_body[0]
    expect(transaction1_json).to eq({
      id: @transaction1.id,
      credit_card_number: @transaction1.credit_card_number,
      invoice_id: nil,
      result: "good",
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a specific transaction by created_at" do

    get "/api/v1/transactions/find_all?created_at=#{@transaction1.created_at}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(1)

    transaction1_json = json_body[0]
    expect(transaction1_json).to eq({
      id: @transaction1.id,
      credit_card_number: @transaction1.credit_card_number,
      invoice_id: nil,
      result: "good",
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end
  it "returns a specific transaction by updated_at" do

    get "/api/v1/transactions/find_all?updated_at=#{@transaction1.updated_at}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(1)

    transaction1_json = json_body[0]
    expect(transaction1_json).to eq({
      id: @transaction1.id,
      credit_card_number: @transaction1.credit_card_number,
      invoice_id: nil,
      result: "good",
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end
end
