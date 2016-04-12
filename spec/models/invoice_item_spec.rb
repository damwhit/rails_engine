require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  it { should belong_to :item }
  it { should belong_to :invoice }

  it { should validate_presence_of :quantity }
  it { should validate_presence_of :unit_price }
  it { should validate_presence_of :created_at }
  it { should validate_presence_of :updated_at }
end
