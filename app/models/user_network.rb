class UserNetwork < ActiveRecord::Base
  belongs_to :user
  belongs_to :network
  attr_accessible :network_id, :status, :user_id
end
