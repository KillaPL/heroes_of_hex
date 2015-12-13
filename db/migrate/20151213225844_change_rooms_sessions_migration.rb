class ChangeRoomsSessionsMigration < ActiveRecord::Migration
  def change
    remove_column :rooms, :session_id, :integer
    add_column :sessions, :room_id, :integer
  end
end
