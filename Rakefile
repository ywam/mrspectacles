require 'active_record'
require 'yaml'
require 'logger'
require 'spectacle'

task :default => :migrate

desc "Migrate the database through scripts in db/migrate. Target specific version with VERSION=x"
task :migrate => :environment do
  ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
end

desc "Populate the database with an xml file"
task :populate => :environment do
  Spectacle.populate_from_xml('RPT_Spec1.xml')
end

task :environment do
  ActiveRecord::Base.establish_connection(YAML::load(File.open('db/database.yml')))
  ActiveRecord::Base.logger = Logger.new(File.open('db/database.log', 'a'))
end
