class RemoveUserIdFromCauses < ActiveRecord::Migration
  def up
    remove_column :causes, :user_id
  end

  def down
    add_column :causes, :user_id, :integer
  end
end
