class Cause < ActiveRecord::Base
  attr_accessible :network_id, :owner_id, :user_id


  has_many :tasks
end
