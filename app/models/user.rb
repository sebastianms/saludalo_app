class User < ActiveRecord::Base
  has_many :user_networks
  has_many :users, :through => :user_networks
  attr_accessible :email, :name, :password
end
