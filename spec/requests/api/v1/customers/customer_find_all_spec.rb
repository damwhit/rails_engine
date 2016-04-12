require 'rails_helper'

RSpec.describe "GET api/v1/customers/find_all?key=value" do
  before do
    @customer1 = create(:customer)
    @customer2 = create(:customer, first_name: "David",
                      last_name: "Whitakerr",
                      created_at: "2012-03-26 14:53:59 UTC",
                      updated_at: "2012-03-26 14:53:59 UTC")
    create(:customer, first_name: "Dave",
                      last_name: "Whittaker",
                      created_at: "2012-03-26 14:53:59 UTC",
                      updated_at: "2012-03-26 14:53:59 UTC")
    @customer3 = create(:customer, first_name: "Michael",
                      last_name: "Whitakerrr",
                      created_at: "2012-03-25 14:53:59 UTC",
                      updated_at: "2012-03-25 14:53:59 UTC")
    create(:customer, first_name: "Mike",
                      last_name: "Whitakerrrr",
                      created_at: "2012-03-25 14:53:59 UTC",
                      updated_at: "2012-03-25 14:53:59 UTC")
  end
  it "returns a list of all customers where id is the same" do

    get "/api/v1/customers/find_all?id=#{@customer1.id}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(1)

    customer1_json = json_body[0]
    expect(customer1_json).to eq({
      id: @customer1.id,
      first_name: @customer1.first_name,
      last_name: @customer1.last_name,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a list of all customers where first_name is the same" do

    get "/api/v1/customers/find_all?first_name=#{@customer1.first_name}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(1)

    customer1_json = json_body[0]
    expect(customer1_json).to eq({
      id: @customer1.id,
      first_name: @customer1.first_name,
      last_name: @customer1.last_name,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a list of all customers where last_name is the same" do

    get "/api/v1/customers/find_all?last_name=#{@customer1.last_name}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(1)

    customer1_json = json_body[0]
    expect(customer1_json).to eq({
      id: @customer1.id,
      first_name: @customer1.first_name,
      last_name: @customer1.last_name,
      created_at: "2012-03-27T14:53:59.000Z",
      updated_at: "2012-03-27T14:53:59.000Z"
      })
  end

  it "returns a list of all customers where created at is the same" do

    get "/api/v1/customers/find_all?created_at=#{@customer2.created_at}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(2)

    customer2_json = json_body[0]
    expect(customer2_json).to eq({
      id: @customer2.id,
      first_name: @customer2.first_name,
      last_name: @customer2.last_name,
      created_at: "2012-03-26T14:53:59.000Z",
      updated_at: "2012-03-26T14:53:59.000Z"
      })
  end

  it "returns a list of all customers where updated at is the same" do

    get "/api/v1/customers/find_all?updated_at=#{@customer3.updated_at}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(2)

    customer3_json = json_body[0]
    expect(customer3_json).to eq({
      id: @customer3.id,
      first_name: @customer3.first_name,
      last_name: @customer3.last_name,
      created_at: "2012-03-25T14:53:59.000Z",
      updated_at: "2012-03-25T14:53:59.000Z"
      })
  end
end
