class Therapist < ActiveRecord::Base
  attr_accessible :address, :email, :name, :phone, :speciality
end
