class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at

  def unit_price
    (object.unit_price / 100.00.to_f).to_s
  end
end
