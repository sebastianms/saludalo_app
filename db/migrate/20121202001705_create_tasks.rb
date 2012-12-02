class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.datetime :start_date
      t.datetime :final_date
      t.integer :cause_id

      t.timestamps
    end
  end
end
