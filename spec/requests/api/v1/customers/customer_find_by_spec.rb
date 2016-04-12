require 'rails_helper'

RSpec.describe "Get api/v1/customers/find?key=value" do
  before do
    @customer1 = create(:customer)
    create(:customer, first_name: "David",
                      last_name: "Whitaker",
                      created_at: "2012-03-26 14:53:59 UTC",
                      updated_at: "2012-03-26 14:53:59 UTC")
    create(:customer, first_name: "Michael",
                      last_name: "Whitaker",
                      created_at: "2012-03-25 14:53:59 UTC",
                      updated_at: "2012-03-25 14:53:59 UTC")
  end

  it "returns a specific customer by id" do

    get "/api/v1/customers/find?id=#{@customer1.id}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(5)
    expect(json_body).to eq({
      id: @customer1.id,
      first_name: @customer1.first_name,
      last_name: @customer1.last_name,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a specific customer by first name" do

    get "/api/v1/customers/find?name=#{@customer1.first_name}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(5)
    expect(json_body).to eq({
      id: @customer1.id,
      first_name: @customer1.first_name,
      last_name: @customer1.last_name,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a specific customer by last name" do

    get "/api/v1/customers/find?name=#{@customer1.last_name}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(5)
    expect(json_body).to eq({
      id: @customer1.id,
      first_name: @customer1.first_name,
      last_name: @customer1.last_name,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a specific customer by created at" do

    get "/api/v1/customers/find?created_at=#{@customer1.created_at}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(5)
    expect(json_body).to eq({
      id: @customer1.id,
      first_name: @customer1.first_name,
      last_name: @customer1.last_name,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a specific customer by updated at" do

    get "/api/v1/customers/find?updated_at=#{@customer1.updated_at}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(5)
    expect(json_body).to eq({
      id: @customer1.id,
      first_name: @customer1.first_name,
      last_name: @customer1.last_name,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end
end
