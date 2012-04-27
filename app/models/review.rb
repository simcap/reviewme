class Review < ActiveRecord::Base
  has_many :commits, :dependent => :destroy
  
  attr_accessible :date, :status
end
