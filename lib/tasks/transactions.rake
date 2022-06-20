require 'csv'

namespace :csv_load do
  desc 'Import transactions'
  task :transactions do
    csv_text = File.read('db/data/transactions.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      #! DO STUFF

    end
  end
end