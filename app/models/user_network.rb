class UserNetwork < ActiveRecord::Base
  attr_accessible :network_id, :status, :user_id
end
