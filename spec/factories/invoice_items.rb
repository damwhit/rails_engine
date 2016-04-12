FactoryGirl.define do
  factory :invoice_item do
    item_id nil
    invoice_id nil
    quantity 1
    unit_price "1000"
    created_at "2012-03-27T14:53:59.000Z"
    updated_at "2012-03-27T14:53:59.000Z"
  end
end
