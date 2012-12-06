class CreateUsersCausesJoinTable < ActiveRecord::Migration
  def up
    create_table :causes_users, :id => false do |t|
      t.integer :cause_id
      t.integer :user_id
    end
  end

  def down
    drop_table :causes_users
  end
end
