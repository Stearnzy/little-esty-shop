require 'csv'

namespace :csv_load do
  desc 'Import Merchants'
  task merchants: :environment do
    load_csv(Merchant, 'merchants')
  end

  desc 'Import Customers'
  task customers: :environment do
    load_csv(Customer, 'customers')
  end

  desc 'Import Items'
  task items: :environment do
    load_csv(Item, 'items')
  end

  desc 'Import Invoices'
  task invoices: :environment do
    load_csv(Invoice, 'invoices')
  end

  desc 'Import Invoice Items'
  task invoice_items: :environment do
    load_csv(InvoiceItem, 'invoice_items')
  end

  desc 'Import Transactions'
  task transactions: :environment do
    load_csv(Transaction, 'transactions')
  end

  desc 'Import All'
  task all: :environment do
    InvoiceItem.destroy_all
    Item.destroy_all
    Transaction.destroy_all
    Invoice.destroy_all
    Customer.destroy_all
    Merchant.destroy_all

    Rake::Task['csv_load:customers'].invoke
    Rake::Task['csv_load:merchants'].invoke
    Rake::Task['csv_load:items'].invoke
    Rake::Task['csv_load:invoices'].invoke
    Rake::Task['csv_load:invoice_items'].invoke
    Rake::Task['csv_load:transactions'].invoke
  end
end

def load_csv(model, file_name)
  csv_text = File.read("db/data/#{file_name}.csv")
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    model.create(row.to_h)
  end

  ActiveRecord::Base.connection.tables.each do |t|
    ActiveRecord::Base.connection.reset_pk_sequence!(t)
  end
end