class AddArmyToRoster < ActiveRecord::Migration
  def change
    add_column :rosters, :army_id, :integer	
  end
end
