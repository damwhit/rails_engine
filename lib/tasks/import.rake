require 'csv'

namespace :data do
  task import: :environment do

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

    invoice = File.join Rails.root, "data/invoices.csv"

    CSV.foreach(invoice, headers: true, header_converters: :symbol) do |row|
      data = row.to_h
      record = Invoice.create(data)
      puts "Created #{record.class}-#{record.id}."
    end

    invoice_item = File.join Rails.root, "data/invoice_items.csv"

    CSV.foreach(invoice_item, headers: true, header_converters: :symbol) do |row|
      data = row.to_h
      record = InvoiceItem.create(data)
      puts "Created #{record.class}-#{record.id}."
    end

    transaction = File.join Rails.root, "data/transactions.csv"

    CSV.foreach(transaction, headers: true, header_converters: :symbol) do |row|
      record = Transaction.create(id: row[:id],
                                  invoice_id: row[:invoice_id],
                                  credit_card_number: row[:credit_card_number],
                                  result: row[:result],
                                  created_at: row[:created_at],
                                  updated_at: row[:updated_at]
      )
      puts "Created #{record.class}-#{record.id}."
    end
  end
end
