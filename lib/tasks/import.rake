require 'csv'

namespace :data do
  task load: :environment do

    merchant = File.join Rails.root, "data/merchants.csv"

    CSV.foreach(merchant, headers: true, header_converters: :symbol) do |row|
      data = row.to_h
      record = Merchant.create(data)
      puts "Created #{record.class}-#{record.id}."
    end

    customer = File.join Rails.root, "data/customers.csv"

    CSV.foreach(customer, headers: true, header_converters: :symbol) do |row|
      data = row.to_h
      record = Customer.create(data)
      puts "Created #{record.class}-#{record.id}."
    end

    item = File.join Rails.root, "data/items.csv"

    CSV.foreach(item, headers: true, header_converters: :symbol) do |row|
      data = row.to_h
      record = Item.create(data)
      puts "Created #{record.class}-#{record.id}."
    end
  end
end
