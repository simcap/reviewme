class Commit < ActiveRecord::Base
  belongs_to :review
  
  attr_accessible :shorthash, :email, :message, :date
end
