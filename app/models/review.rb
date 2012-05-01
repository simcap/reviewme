class Review < ActiveRecord::Base
  has_many :commits, :dependent => :destroy
  
  belongs_to :reviewer

  attr_accessible :publisher_email, :publisher_name, :subject, :branch, :date, :status, :reviewer_id
    
  def self.new_pending
    review = Review.new
    review.date = Time.now
    review.status = :pending
    return review
  end
end
