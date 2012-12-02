class AddAffectedNameToCauses < ActiveRecord::Migration
  def change
    add_column :causes, :affected_name, :string
  end
end
