require 'csv'

namespace :csv_load do
  desc 'Import items'
  task :items do
    csv_text = File.read('db/data/items.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      #! DO STUFF

    end
  end
end