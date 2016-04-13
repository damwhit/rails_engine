class Item < ActiveRecord::Base
  before_create :price_to_dollars

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true

  def price_to_dollars
    self.unit_price = (unit_price / 100.0)
  end
end
