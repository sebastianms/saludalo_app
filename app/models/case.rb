class Case < ActiveRecord::Base
  attr_accessible :network_id, :owner_id, :user_id
end
