class AddArmyToUnit < ActiveRecord::Migration
  def change
    add_column :units, :army_id, :integer	  	
  end
end
