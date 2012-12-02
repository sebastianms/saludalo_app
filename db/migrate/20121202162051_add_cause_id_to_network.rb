class AddCauseIdToNetwork < ActiveRecord::Migration
  def up
    add_column :networks, :cause_id, :integer
  end
  def down
    remove_column :networks, :cause_id, :integer
  end
end
