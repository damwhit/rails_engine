class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices

  validates :name, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true

  def self.top_revenue(quantity)
    select( "merchants.*", "SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue").joins(:invoices => [:transactions, :invoice_items]).where(transactions: {result: "success"}).group(:id).order("revenue DESC").take(quantity)
  end

  def self.top_items(quantity)
    select( "merchants.*", "SUM(invoice_items.quantity) AS item_count").joins(:invoices => [:transactions, :invoice_items]).where(transactions: {result: "success"}).group(:id).order("item_count DESC").take(quantity)
  end

  def revenue
    invoices.joins(:transactions, :invoice_items).where(transactions: {result: "success"}).sum("invoice_items.unit_price * invoice_items.quantity")
  end

  def revenue_by_date(date)
    invoices.joins(:transactions, :invoice_items).where(invoices: {created_at: date}).where(transactions: {result: "success"}).sum("invoice_items.unit_price * invoice_items.quantity")
  end

  def favorite_customer
    customers.select("customers.*", "COUNT(transactions) AS transaction_count").joins(:transactions).where(transactions: {result: "success"}).group(:id).order("transaction_count DESC").first
  end

  def customers_with_pending_invoices
    Customer.find(invoices.joins(:transactions).where(transactions: {result: "failed"}).pluck(:customer_id))
  end
end
