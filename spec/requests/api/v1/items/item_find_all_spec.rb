require 'rails_helper'

RSpec.describe "GET api/v1/items/find_all?key=value" do
  before do
    @item1 = create(:item)
    @item2 = create(:item, name: "basketball",
                  description: "sooo kewl",
                  unit_price: 10000,
                      created_at: "2012-03-26 14:53:59 UTC",
                      updated_at: "2012-03-26 14:53:59 UTC")
    create(:item, name: "basketball",
                  description: "sooo kewl",
                  unit_price: 10000,
                      created_at: "2012-03-26 14:53:59 UTC",
                      updated_at: "2012-03-26 14:53:59 UTC")
    @item4 = create(:item, name: "Football",
                  description: "sooo kewl",
                  unit_price: 10000,
                      created_at: "2012-03-25 14:53:59 UTC",
                      updated_at: "2012-03-25 14:53:59 UTC")
    create(:item, name: "Football",
                  description: "sooo kewl",
                  unit_price: 10000,
                      created_at: "2012-03-25 14:53:59 UTC",
                      updated_at: "2012-03-25 14:53:59 UTC")

  end
  it "returns a list of all items where id is the same" do

    get "/api/v1/items/find_all?id=#{@item1.id}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(1)

    item1_json = json_body[0]
    expect(item1_json).to eq({
      id: @item1.id,
      name: @item1.name,
      :description => "America's past time",
      :unit_price => "10.0",
      :merchant_id => nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a list of all items where name is the same" do

    get "/api/v1/items/find_all?name=#{@item1.name}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(1)

    item1_json = json_body[0]
    expect(item1_json).to eq({
      id: @item1.id,
      name: @item1.name,
      :description => "America's past time",
      :unit_price => "10.0",
      :merchant_id => nil,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a list of all items where created at is the same" do

    get "/api/v1/items/find_all?created_at=#{@item2.created_at}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(2)

    item2_json = json_body[0]
    expect(item2_json).to eq({:id=>13,
       :name=>"basketball",
       :description=>"sooo kewl",
       :unit_price=>"100.0",
       :merchant_id=>nil,
       :created_at=>"2012-03-26T14:53:59.000Z",
       :updated_at=>"2012-03-26T14:53:59.000Z"})
  end

  it "returns a list of all items where updated at is the same" do

    get "/api/v1/items/find_all?updated_at=#{@item4.updated_at}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(2)

    item4_json = json_body[0]
    expect(item4_json).to eq({:id=>20,
      :name=>"Football",
      :description=>"sooo kewl",
      :unit_price=>"100.0",
      :merchant_id=>nil,
      :created_at=>"2012-03-25T14:53:59.000Z",
      :updated_at=>"2012-03-25T14:53:59.000Z"})
  end
end
