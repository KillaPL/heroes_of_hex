class Session < ActiveRecord::Base
  belongs_to :room

  before_create do
    self.value = SecureRandom.hex(40)
  end

  def alive?
    created_at + 6.hours > Time.now
  end
end
