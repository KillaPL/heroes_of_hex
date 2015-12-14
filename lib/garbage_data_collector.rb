require 'dotenv'
Dotenv.load

# require 'pry'
# binding.pry

require 'active_record'

require 'active_support/values/time_zone'
require 'active_support/core_ext/time/zones'
require_relative "./../app/models/session"
require_relative "./../app/models/room"

db_config = nil

if ENV["HOME"] == "/home/deploy"
  db_config = {
    adapter: 'postgresql',
    pool: 1,
    timeout: 5000,
    database: 'hoh_production',
    host: 'localhost',
    encoding: 'utf8',
    username: ENV['HOH_DATABASE_USER'],
    password: ENV['HOH_DATABASE_PASSWORD'],
  }
else
  db_config = {
    adapter: 'postgresql',
    pool: 1,
    timeout: 5000,
    database: 'hoh_dev'
  }
end

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
