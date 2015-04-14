# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "csv"

data_filter = File.dirname(__FILE__) + "/data/*.csv"

Dir[data_filter].each do |file_path|
  table_name = File.basename file_path, ".csv"
  csv_text = File.read file_path
  csv = CSV.parse csv_text, headers: true
  csv.each do |row|
   table_name.classify.constantize.create row.to_hash
  end
end
