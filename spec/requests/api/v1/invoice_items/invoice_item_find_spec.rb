require 'rails_helper'

RSpec.describe "Get api/v1/invoice_items/find?key=value" do
  before do
    @invoice_item1 = create(:invoice_item)
    create(:invoice_item, quantity: 10,
                          unit_price: "10.00",
                          invoice_id: nil,
                          item_id: nil,
                          created_at: "2012-03-26 14:53:59 UTC",
                          updated_at: "2012-03-26 14:53:59 UTC")
    create(:invoice_item, quantity: 11,
                          unit_price: "10.00",
                          invoice_id: nil,
                          item_id: nil,
                          created_at: "2012-03-25 14:53:59 UTC",
                          updated_at: "2012-03-25 14:53:59 UTC")
  end

  it "returns a specific invoice item by id" do

    get "/api/v1/invoice_items/find?id=#{@invoice_item1.id}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(7)
    expect(json_body).to eq({
      id: @invoice_item1.id,
      quantity: @invoice_item1.quantity,
      unit_price: "10.0",
      invoice_id: nil,
      item_id: nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a specific invoice item by quantity" do

    get "/api/v1/invoice_items/find?quantity=#{@invoice_item1.quantity}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(7)
    expect(json_body).to eq({
      id: @invoice_item1.id,
      quantity: @invoice_item1.quantity,
      unit_price: "10.0",
      invoice_id: nil,
      item_id: nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a specific invoice item by created at" do

    get "/api/v1/invoice_items/find?created_at=#{@invoice_item1.created_at}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(7)
    expect(json_body).to eq({
      id: @invoice_item1.id,
      quantity: @invoice_item1.quantity,
      unit_price: "10.0",
      invoice_id: nil,
      item_id: nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a specific invoice item by updated at" do

    get "/api/v1/invoice_items/find?updated_at=#{@invoice_item1.updated_at}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(7)
    expect(json_body).to eq({
      id: @invoice_item1.id,
      quantity: @invoice_item1.quantity,
      unit_price: "10.0",
      invoice_id: nil,
      item_id: nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end
end
