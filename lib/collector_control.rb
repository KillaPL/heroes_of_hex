require 'daemons'
# require 'pry'
# binding.pry
Daemons.run('lib/garbage_data_collector.rb')
