class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.integer :points_limit
      t.string :name

      t.timestamps
    end
  end
end
