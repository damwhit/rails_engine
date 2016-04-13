require 'rails_helper'

RSpec.describe "GET api/v1/invoice_items/find_all?key=value" do
  before do
    @invoice_item1 = create(:invoice_item)
    @invoice_item2 = create(:invoice_item,
                        quantity: 10,
                        unit_price: "10.00",
                        invoice_id: nil,
                        item_id: nil,
                        created_at: "2012-03-26 14:53:59 UTC",
                        updated_at: "2012-03-26 14:53:59 UTC")
    create(:invoice_item,
                        quantity: 11,
                        unit_price: "10.00",
                        invoice_id: nil,
                        item_id: nil,
                        created_at: "2012-03-26 14:53:59 UTC",
                        updated_at: "2012-03-26 14:53:59 UTC")
    @invoice_item4 = create(:invoice_item, quantity: 11,
                          unit_price: "10.00",
                          invoice_id: nil,
                          item_id: nil,
                          created_at: "2012-03-25 14:53:59 UTC",
                          updated_at: "2012-03-25 14:53:59 UTC")
    create(:invoice_item, quantity: 11,
                          unit_price: "10.00",
                          invoice_id: nil,
                          item_id: nil,
                          created_at: "2012-03-25 14:53:59 UTC",
                          updated_at: "2012-03-25 14:53:59 UTC")
  end

  it "returns a list of all invoice items where id is the same" do

    get "/api/v1/invoice_items/find_all?id=#{@invoice_item1.id}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(1)

    invoice_item1_json = json_body[0]
    expect(invoice_item1_json).to eq({
      id: @invoice_item1.id,
      quantity: @invoice_item1.quantity,
      unit_price: "10.0",
      invoice_id: nil,
      item_id: nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a list of all invoice items where quantity is the same" do

    get "/api/v1/invoice_items/find_all?quantity=#{@invoice_item1.quantity}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(1)

    invoice_item1_json = json_body[0]
    expect(invoice_item1_json).to eq({
      id: @invoice_item1.id,
      quantity: @invoice_item1.quantity,
      unit_price: "10.0",
      invoice_id: nil,
      item_id: nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a list of all invoice items where created at is the same" do

    get "/api/v1/invoice_items/find_all?created_at=#{@invoice_item2.created_at}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(2)

    invoice_item2_json = json_body[0]
    expect(invoice_item2_json).to eq({
      :id=> @invoice_item2.id,
      :item_id=>nil,
      :invoice_id=>nil,
      :quantity=>10,
      :unit_price=>"0.1", :created_at=>"2012-03-26T14:53:59.000Z", :updated_at=>"2012-03-26T14:53:59.000Z"})
  end

  it "returns a list of all invoice items where updated at is the same" do

    get "/api/v1/invoice_items/find_all?updated_at=#{@invoice_item4.updated_at}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(2)

    invoice_item4_json = json_body[0]
    expect(invoice_item4_json).to eq({
      :id=>@invoice_item4.id,
      :item_id=>nil,
      :invoice_id=>nil,
      :quantity=>11,
      :unit_price=>"0.1", :created_at=>"2012-03-25T14:53:59.000Z", :updated_at=>"2012-03-25T14:53:59.000Z"})
  end
end
