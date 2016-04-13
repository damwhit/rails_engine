require 'rails_helper'

RSpec.describe "GET api/v1/customers/:customer_id/invoices" do
  it "returns a list of all invoices associated with a given customer" do
    customer1 = create(:customer)
    invoice1 = create(:invoice)
    customer1.invoices << invoice1

    2.times do
      customer1.invoices << create(:invoice)
    end

    get "/api/v1/customers/#{customer1.id}/invoices"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(3)

    invoice1_json = json_body[0]
    expect(invoice1_json).to eq({
       :id=> invoice1.id,
       :status=>"MyString",
       :merchant_id => nil,
       :customer_id=> customer1.id,
       :created_at=> format_date(invoice1.created_at),
       :updated_at=> format_date(invoice1.updated_at)
       })
  end
end
