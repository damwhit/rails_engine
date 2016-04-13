class Customer < ActiveRecord::Base
  has_many :invoices
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true
end
