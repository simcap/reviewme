class Commit < ActiveRecord::Base
  attr_accessible :shorthash, :branch, :email, :message, :date
end
