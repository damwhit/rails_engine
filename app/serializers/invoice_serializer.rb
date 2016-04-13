class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :merchant_id, :status, :created_at, :updated_at

  def format_price
    object.unit_price = (unit_price / 100.00.to_f).to_s
  end
end
