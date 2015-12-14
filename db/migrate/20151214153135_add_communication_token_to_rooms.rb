class AddCommunicationTokenToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :communication_token, :string
  end
end
