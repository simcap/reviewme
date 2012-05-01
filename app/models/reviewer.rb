class Reviewer < ActiveRecord::Base
  validates :email, :uniqueness => true

  has_many :reviews
  
  attr_accessible :id, :email
  
  def self.register_new_publisher_as_reviewer(review)
    Reviewer.create(:email => review.publisher_email) unless Reviewer.exists?(:email => review.publisher_email)
  end
  
end
