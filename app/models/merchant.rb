class Merchant < ActiveRecord::Base
  has_many :items
  
  validates :name, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true
end
