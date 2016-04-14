class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true

  def favorite_merchant
    merchants.select("merchants.*", "COUNT(transactions) AS transaction_count").joins(:transactions).where(transactions: {result: "success"}).group(:id).order("transaction_count DESC").first
  end
end
