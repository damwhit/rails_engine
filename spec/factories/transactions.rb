FactoryGirl.define do
  factory :transaction do
    invoice_id nil
    credit_card_number "4242424242424242"
    result "good"
    created_at "2012-03-27T14:53:59.000Z"
    updated_at "2012-03-27T14:53:59.000Z"
  end
end
