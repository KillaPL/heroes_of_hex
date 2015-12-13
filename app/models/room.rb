class Room < ActiveRecord::Base
  has_many :sessions

  validates_presence_of :name, :point_limit
  validates_uniqueness_of :name

  def sessions_count
    sessions.count
  end
end

