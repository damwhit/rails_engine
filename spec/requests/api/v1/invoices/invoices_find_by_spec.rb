require 'rails_helper'

RSpec.describe "Get api/v1/invoices/find?key=value" do
  before do
    @invoice1 = create(:invoice)
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
  end
  it "returns a specific invoice by id" do

    get "/api/v1/invoices/find?id=#{@invoice1.id}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(6)
    expect(json_body).to eq({
      id: @invoice1.id,
      status: @invoice1.status,
      customer_id: nil,
      merchant_id: nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a specific invoice by status" do

    get "/api/v1/invoices/find?status=#{@invoice1.status}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(6)
    expect(json_body).to eq({
      id: @invoice1.id,
      status: @invoice1.status,
      customer_id: nil,
      merchant_id: nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a specific invoice by created at" do

    get "/api/v1/invoices/find?created_at=#{@invoice1.created_at}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(6)
    expect(json_body).to eq({
      id: @invoice1.id,
      status: @invoice1.status,
      customer_id: nil,
      merchant_id: nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a specific invoice by updated at" do

    get "/api/v1/invoices/find?updated_at=#{@invoice1.updated_at}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(6)
    expect(json_body).to eq({
      id: @invoice1.id,
      status: @invoice1.status,
      customer_id: nil,
      merchant_id: nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end
end
