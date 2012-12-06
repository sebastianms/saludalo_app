class User < ActiveRecord::Base
  has_and_belongs_to_many :causes
  has_many :tasks

  attr_accessible :email, :name, :password
  validates_presence_of :email

  def register(params)
  	self.name = params[:name]
  	self.email = params[:email]
  	cause = Cause.new
  	cause.owner = self
  	cause.save
  	self.causes << cause

  	if params[:password] == params[:confirm_password]
  		return self.save
  	else
  		return false
  	end
  end
  
  def generate_invitation_token
    begin
      token = SecureRandom.urlsafe_base64
    end while User.where(:invitation_token => token).exists?
    self.invitation_token = token
  end
end
