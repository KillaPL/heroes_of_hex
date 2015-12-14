class Room < ActiveRecord::Base
  has_many :sessions

  validates_presence_of :name, :point_limit
  validates_uniqueness_of :name

  scope :empty, -> { joins("LEFT JOIN sessions ON sessions.room_id = rooms.id").where("sessions.room_id IS NULL") }

  def sessions_count
    sessions.count
  end
end
