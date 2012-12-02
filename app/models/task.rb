class Task < ActiveRecord::Base
  attr_accessible :cause_id, :description, :final_date, :start_date, :title, :user_id
end
