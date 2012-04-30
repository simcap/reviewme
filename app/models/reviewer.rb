class Reviewer < ActiveRecord::Base
  has_many :reviews
  
  attr_accessible :id, :email
end
