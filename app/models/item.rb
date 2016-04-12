class Item < ActiveRecord::Base
  before_create :format_price

  belongs_to :merchant

  validates :name, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true


  def format_price
    self.unit_price = (unit_price.to_i / 100.00.to_f).to_s
  end
end
