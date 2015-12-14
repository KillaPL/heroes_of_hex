class AddAliveUntilToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :alive_until, :datetime
  end
end
