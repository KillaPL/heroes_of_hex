class Unit < ActiveRecord::Base
	has_many :troops
	has_many :rosters, :through => :troops
    belongs_to :army	
end