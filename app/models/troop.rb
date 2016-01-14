class Troop < ActiveRecord::Base
	belongs_to :unit
	belongs_to :roster

	before_save :default_values
	def default_values
	    self.total_price ||= unit.points * unit_size
	end

    validates_presence_of :unit_size

end