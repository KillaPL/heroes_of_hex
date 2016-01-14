class Unit < ActiveRecord::Base
	has_many :troops
	has_many :rosters, :through => :troops
    has_one :army	
end