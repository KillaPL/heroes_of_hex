class CreateTroops < ActiveRecord::Migration
  def change
    create_table :troops, id:false do |t|
      t.integer :unit_id, index:true
      t.integer :roster_id, index:true
      t.integer :unit_size
      t.integer :total_price
    end
  end
end
