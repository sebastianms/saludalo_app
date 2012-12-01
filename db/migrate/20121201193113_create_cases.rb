class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.integer :user_id
      t.integer :owner_id
      t.integer :network_id

      t.timestamps
    end
  end
end
