class TotalRevenueByDateSerializer < ActiveModel::Serializer
  attributes :total_revenue

  def total_revenue
    object
  end
end
