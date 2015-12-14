require 'pry'

require 'active_record'
require_relative "./../app/models/session"
require_relative "./../app/models/room"


environment = 'development'

db_config       = YAML::load(File.open('config/database.yml'))[environment]
db_config['pool'] = 1
ActiveRecord::Base.establish_connection(db_config)

puts "starting!"

loop do
  count = Room.empty.count
  if count.zero?
    puts "#{Time.now} | Nothing to do "
  else
    puts "#{Time.now} | Removing #{count} empty rooms"
    Room.empty.destroy_all
  end
  sleep 1
end
