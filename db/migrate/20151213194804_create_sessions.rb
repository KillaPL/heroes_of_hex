class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :value

      t.timestamps
    end
  end
end
