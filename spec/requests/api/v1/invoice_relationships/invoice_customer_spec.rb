require 'rails_helper'

RSpec.describe "GET api/v1/invoices/:invoice_id/customer" do
  it "returns customer associated with a given invoice" do
    customer1 = create(:customer)
    invoice1 = create(:invoice)
    customer1.invoices << invoice1

    get "/api/v1/invoices/#{invoice1.id}/customer"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(5)
    expect(json_body).to eq({
       :id=> customer1.id,
       first_name: customer1.first_name,
       last_name: customer1.last_name,
       :created_at=> format_date(customer1.created_at),
       :updated_at=> format_date(customer1.updated_at)
       })
  end
end
