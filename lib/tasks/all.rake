# require_relative './customers.rake'

namespace :csv_load do
  desc 'Load all CSVs'
  task :all do
    Rake::Task['csv_load:customers'].invoke
    Rake::Task['csv_load:invoice_items'].invoke
    Rake::Task['csv_load:invoices'].invoke
    Rake::Task['csv_load:items'].invoke
    Rake::Task['csv_load:merchants'].invoke
    Rake::Task['csv_load:transactions'].invoke
  end
end