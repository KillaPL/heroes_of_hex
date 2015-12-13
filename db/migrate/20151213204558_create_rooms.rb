class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :session_id
      t.string  :name
      t.boolean :public, default: true
      t.integer :point_limit

      t.timestamps
    end
  end
end
