class AddUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string  :name
      t.integer :points
      t.string  :slot
      t.integer :speed      
      t.integer :attack
      t.integer :defense
      t.integer :damage_min
      t.integer :damage_max
      t.integer :hp
      t.integer :ammunition
      t.integer :shooting_range
      t.timestamps
    end  	
  end
end
