require 'rails_helper'

RSpec.describe "GET api/v1/merchants/find_all?key=value" do
  before do
    @merchant1 = create(:merchant)
    @merchant2 = create(:merchant, name: "David",
                                   created_at: "2012-03-26 14:53:59 UTC",
                                   updated_at: "2012-03-26 14:53:59 UTC")
    create(:merchant, name: "Dave",
                      created_at: "2012-03-26 14:53:59 UTC",
                      updated_at: "2012-03-26 14:53:59 UTC")
    @merchant4 = create(:merchant, name: "Michael",
                                   created_at: "2012-03-25 14:53:59 UTC",
                                   updated_at: "2012-03-25 14:53:59 UTC")
    create(:merchant, name: "Mike",
                      created_at: "2012-03-25 14:53:59 UTC",
                      updated_at: "2012-03-25 14:53:59 UTC")

  end
  it "returns a list of all merchants where id is the same" do

    get "/api/v1/merchants/find_all?id=#{@merchant1.id}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(1)

    merchant1_json = json_body[0]
    expect(merchant1_json).to eq({
      id: @merchant1.id,
      name: @merchant1.name,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a list of all merchants where name is the same" do

    get "/api/v1/merchants/find_all?name=#{@merchant1.name}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(1)

    merchant1_json = json_body[0]
    expect(merchant1_json).to eq({
      id: @merchant1.id,
      name: @merchant1.name,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a list of all merchants where created at is the same" do

    get "/api/v1/merchants/find_all?created_at=#{@merchant2.created_at}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(2)

    merchant2_json = json_body[0]
    expect(merchant2_json).to eq({
      id: @merchant2.id,
      name: @merchant2.name,
      created_at: "2012-03-26T14:53:59.000Z",
      updated_at: "2012-03-26T14:53:59.000Z"
      })
  end

  it "returns a list of all merchants where updated at is the same" do

    get "/api/v1/merchants/find_all?updated_at=#{@merchant4.updated_at}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(2)

    merchant4_json = json_body[0]
    expect(merchant4_json).to eq({
      id: @merchant4.id,
      name: @merchant4.name,
      created_at: "2012-03-25T14:53:59.000Z",
      updated_at: "2012-03-25T14:53:59.000Z"
      })
  end
end
