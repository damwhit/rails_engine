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

  def self.top_revenue(quantity)
    select( "items.*", "SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue").joins(:invoices => [:transactions, :invoice_items]).where(transactions: {result: "success"}).group(:id).order("revenue DESC").take(quantity)
  end

  def self.best_seller(quantity)
    select( "items.*", "COUNT(invoice_items.quantity) AS item_count").joins(invoices: [:transactions, :invoice_items]).where(transactions: {result: "success"}).group(:id).order("item_count DESC").take(quantity)
  end

  def best_selling_date
    invoices.select("invoices.created_at", "SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue").joins(:transactions).where(transactions: {result: "success"}).group("created_at").order("revenue DESC").first.created_at
  end
end
