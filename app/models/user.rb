class User < ActiveRecord::Base
  has_many :user_networks
  has_many :users, :through => :user_networks
  has_one :cause
  has_many :task

  attr_accessible :email, :name, :password
  validates_presence_of :email

  def register(params)
  	self.name = params[:name]
  	self.email = params[:email]
  	cause = Cause.new
  	network = Network.new
  	network.save
  	cause.network = network
  	cause.save
  	self.cause = cause
  	if params[:password] == params[:confirm_password]
  		return self.save
  	else
  		return false
  	end
  end
end
