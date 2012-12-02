class Network < ActiveRecord::Base
  has_many :user_networks
  has_many :users, :through => :user_networks
  belongs_to :cause
  # attr_accessible :title, :body
end
