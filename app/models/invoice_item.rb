class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  validates :quantity, presence: true
  validates :unit_price, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true
end
