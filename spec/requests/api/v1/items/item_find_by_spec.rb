require 'rails_helper'

RSpec.describe "Get api/v1/items/find?key=value" do
  before do
    @item1 = create(:item)
    create(:item, name: "basketball",
                  description: "sooo kewl",
                  unit_price: 10000,
                      created_at: "2012-03-26 14:53:59 UTC",
                      updated_at: "2012-03-26 14:53:59 UTC")
    create(:item, name: "Football",
                  description: "sooo kewl",
                  unit_price: 10000,
                      created_at: "2012-03-25 14:53:59 UTC",
                      updated_at: "2012-03-25 14:53:59 UTC")
  end

  it "returns a specific item by id" do

    get "/api/v1/items/find?id=#{@item1.id}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(7)
    expect(json_body).to eq({
      id: @item1.id,
      name: @item1.name,
      :description => "America's past time",
      :unit_price => "10.0",
      :merchant_id => nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a specific item by name" do

    get "/api/v1/items/find?name=#{@item1.name}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(7)
    expect(json_body).to eq({
      id: @item1.id,
      name: @item1.name,
      :description => "America's past time",
      :unit_price => "10.0",
      :merchant_id => nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a specific item by description" do

    get "/api/v1/items/find?description=#{@item1.description}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(7)
    expect(json_body).to eq({
      id: @item1.id,
      name: @item1.name,
      :description => "America's past time",
      :unit_price => "10.0",
      :merchant_id => nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a specific item by price" do

    get "/api/v1/items/find?unit_price=#{@item1.unit_price}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(7)
    expect(json_body).to eq({
      id: @item1.id,
      name: @item1.name,
      :description => "America's past time",
      :unit_price => "10.0",
      :merchant_id => nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a specific item by created at" do

    get "/api/v1/items/find?created_at=#{@item1.created_at}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(7)
    expect(json_body).to eq({
      id: @item1.id,
      name: @item1.name,
      :description => "America's past time",
      :unit_price => "10.0",
      :merchant_id => nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a specific item by updated at" do

    get "/api/v1/items/find?updated_at=#{@item1.updated_at}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(7)
    expect(json_body).to eq({
      id: @item1.id,
      name: @item1.name,
      :description => "America's past time",
      :unit_price => "10.0",
      :merchant_id => nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end
end
