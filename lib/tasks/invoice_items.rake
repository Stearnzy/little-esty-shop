require 'csv'

namespace :csv_load do
  desc 'Import invoice items'
  task :invoice_items do
    csv_text = File.read('db/data/invoice_items.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      #! DO STUFF

    end
  end
end