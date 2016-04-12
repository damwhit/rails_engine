FactoryGirl.define do
  factory :invoice do
    customer_id nil
    merchant_id nil
    status "MyString"
    created_at "2012-03-27T14:53:59.000Z"
    updated_at "2012-03-27T14:53:59.000Z"
  end
end
