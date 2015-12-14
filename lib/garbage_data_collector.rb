require 'dotenv'
Dotenv.load

# require 'pry'

require 'active_record'

require 'active_support/values/time_zone'
require 'active_support/core_ext/time/zones'
require_relative "./../app/models/session"
require_relative "./../app/models/room"

environment = nil

if ENV["HOME"] == "/home/deploy"
  environment = 'production'
else
  environment = 'development'
end

db_config       = YAML::load(File.open('config/database.yml'))[environment]
db_config['pool'] = 1
db_config['username'] = ENV['HOH_DATABASE_USER']
db_config["password"] = ENV['HOH_DATABASE_PASSWORD']

# => {"adapter"=>"postgresql",
#  "pool"=>1,
#  "timeout"=>5000,
#  "database"=>"hoh_production",
#  "host"=>"localhost",
#  "encoding"=>"utf8",
#  "username"=>"<%= ENV['HOH_DATABASE_USER'] %>",
#  "password"=>"<%= ENV['HOH_DATABASE_PASSWORD'] %>"}

# binding.pry

ActiveRecord::Base.establish_connection(db_config)

Time.zone = 'Warsaw'

puts "starting!"

loop do
  # binding.pry
  rooms_count    = Room.empty.count
  sessions_count = Session.dead.count
  Session.dead.destroy_all
  Room.empty.destroy_all
  puts "#{Time.now} | Removed #{sessions_count} dead sessions and #{rooms_count} empty rooms"
  sleep 1
end
