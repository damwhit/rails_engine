require 'csv'

namespace :data do
  task import: :environment do

    merchant = File.join Rails.root, "data/merchants.csv"

    CSV.foreach(merchant, headers: true, header_converters: :symbol) do |row|
      data = row.to_h
      record = Merchant.create(data)
      puts "Created #{record.class}-#{record.id}."
    end
  end
end
