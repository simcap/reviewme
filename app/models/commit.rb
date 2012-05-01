class Commit < ActiveRecord::Base
  validates :shorthash, :message, :date, :presence => true
  
  belongs_to :review
  
  attr_accessible :shorthash, :email, :message, :date
end
