require 'csv'

namespace :db_seeds do
  desc 'Loads Airports to DB'
  task load_airports: :environment do
    puts 'Starting task....'
    puts 'Getting airports'

    CSV.foreach("#{Rails.root}/lib/tasks/resources/airports.csv", headers: true) do |row|
      Airport.new(
        name: row.to_hash['name'],
        city: row.to_hash['city'],
        iata: row.to_hash['iata']
      ).save
    end

    puts "Saved airports: #{Airport.count}"
  end
end
