class Session < ActiveRecord::Base
  belongs_to :room

  before_create do
    self.value = SecureRandom.hex(40)
  end

  scope :dead, ->{ where("alive_until < ?", Time.zone.now) }

  def mark_as_alive!
    update(alive_until: Time.now + 20.seconds)
  end
end
