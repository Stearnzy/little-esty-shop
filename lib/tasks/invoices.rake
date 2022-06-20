require 'csv'

namespace :csv_load do
  desc 'Import invoices'
  task :invoices do
    csv_text = File.read('db/data/invoices.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      #! DO STUFF

    end
  end
end