class AddFeedbackAndStatusToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :mark, :integer, :default => 1
    add_column :tasks, :status, :string, :default => "pending"
  end
end
