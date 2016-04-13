class InvoiceItem < ActiveRecord::Base
  before_create :price_to_dollars
  belongs_to :item
  belongs_to :invoice

  validates :quantity, presence: true
  validates :unit_price, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true

  def price_to_dollars
    self.unit_price = (unit_price / 100.0)
  end
end
