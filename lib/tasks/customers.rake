require 'csv'

namespace :csv_load do
  desc 'Import customers'
  task :customers do
    csv_text = File.read('db/data/customers.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      #! DO STUFF
      Customer.create(row)
    end

    # ActiveRecord::Base.connection.tables.each do |t|
    #   ActiveRecord::Base.connection.reset_pk_sequence!(t)
    # end
  end
end