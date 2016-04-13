class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  validates :name, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true

  def self.top_revenue(quantity)
    select( "merchants.*", "SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue").joins(:invoices => [:transactions, :invoice_items]).where(transactions: {result: "success"}).group(:id).order("revenue DESC").take(quantity)
  end

  def self.top_items(quantity)
    select( "merchants.*", "SUM(invoice_items.quantity) AS item_count").joins(:invoices => [:transactions, :invoice_items]).where(transactions: {result: "success"}).group(:id).order("item_count DESC").take(quantity)
  end
end
