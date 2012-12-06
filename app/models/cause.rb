class Cause < ActiveRecord::Base
  attr_accessible :affected_name
  
  has_and_belongs_to_many :users
  has_one :owner, :class_name => "User"
  has_many :tasks
  
  def register(params)
  	self.owner_id = params[:user_id]
  	return self.save
  end
end
