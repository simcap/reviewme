class Commit < ActiveRecord::Base
  belongs_to :review
  
  attr_accessible :shorthash, :branch, :email, :message, :date
end
