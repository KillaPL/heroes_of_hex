class Roster < ActiveRecord::Base
	has_many :troops
	has_many :units, :through => :troops
    has_one :army
    belongs_to :user
    
     accepts_nested_attributes_for :troops

    validates_presence_of :name, :points_limit, :user_id, :army_id
    validate :units_points_under_points_limit
    validate :slots_under_limits

    def units_points_under_points_limit
    	if troops.sum(:total_price) > points_limit
    		errors.add(:points_limit, "points overlimited")
    	end
    end

    def slots_under_limits
    	if units.where(slot:'Elite').count() > 1     ||
		   units.where(slot:'Tactical').count() > 1  ||
		   units.where(slot:'Artillery').count() > 2 ||
		   units.where(slot:'Mercanary').count() > 2
		   		errors.add(:troops, "slots overlimited")
		end
    end
	
end