require 'rails_helper'

RSpec.describe "GET api/v1/invoices/find_all?key=value" do
  before do
    @invoice1 = create(:invoice)
    @invoice2 = create(:invoice, status: "David",
                                 customer_id: nil,
                                 merchant_id: nil,
                                 created_at: "2012-03-26 14:53:59 UTC",
                                 updated_at: "2012-03-26 14:53:59 UTC")
    create(:invoice, status: "Dave",
                      customer_id: nil,
                      merchant_id: nil,
                      created_at: "2012-03-26 14:53:59 UTC",
                      updated_at: "2012-03-26 14:53:59 UTC")
    @invoice4 = create(:invoice, status: "Michael",
                      customer_id: nil,
                      merchant_id: nil,
                      created_at: "2012-03-25 14:53:59 UTC",
                      updated_at: "2012-03-25 14:53:59 UTC")
    create(:invoice, status: "Mike",
                      customer_id: nil,
                      merchant_id: nil,
                      created_at: "2012-03-25 14:53:59 UTC",
                      updated_at: "2012-03-25 14:53:59 UTC")
  end

  it "returns a list of all invoices where id is the same" do

    get "/api/v1/invoices/find_all?id=#{@invoice1.id}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(1)

    invoice1_json = json_body[0]
    expect(invoice1_json).to eq({
      id: @invoice1.id,
      status: @invoice1.status,
      customer_id: nil,
      merchant_id: nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a list of all invoices where status is the same" do

    get "/api/v1/invoices/find_all?status=#{@invoice1.status}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(1)

    invoice1_json = json_body[0]
    expect(invoice1_json).to eq({
      id: @invoice1.id,
      status: @invoice1.status,
      customer_id: nil,
      merchant_id: nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a list of all invoices where created at is the same" do

    get "/api/v1/invoices/find_all?created_at=#{@invoice2.created_at}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(2)

    invoice2_json = json_body[0]
    expect(invoice2_json).to eq({
      id: @invoice2.id,
      status: @invoice2.status,
      customer_id: nil,
      merchant_id: nil,
      created_at: "2012-03-26T14:53:59.000Z",
      updated_at: "2012-03-26T14:53:59.000Z"
      })
  end

  it "returns a list of all invoices where updated at is the same" do

    get "/api/v1/invoices/find_all?updated_at=#{@invoice4.updated_at}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(2)

    invoice4_json = json_body[0]
    expect(invoice4_json).to eq({
      id: @invoice4.id,
      status: @invoice4.status,
      customer_id: nil,
      merchant_id: nil,
      created_at: "2012-03-25T14:53:59.000Z",
      updated_at: "2012-03-25T14:53:59.000Z"
      })
  end
end
