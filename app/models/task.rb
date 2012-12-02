class Task < ActiveRecord::Base
  attr_accessible :cause_id, :description, :final_date, :start_date, :title, :user_id, :mark, :status
  belongs_to :user
  belongs_to :cause

end
