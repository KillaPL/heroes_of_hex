class Army < ActiveRecord::Base
	has_many :rosters
	has_many :units
end