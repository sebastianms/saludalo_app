class Cause < ActiveRecord::Base
  attr_accessible :network_id, :owner_id, :user_id

  def register(params)
  	self.user_id = params[:user_id]
  	self.owner_id = params[:user_id]
  	return self.save
  end
end
