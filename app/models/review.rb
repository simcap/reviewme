class Review < ActiveRecord::Base
  has_many :commits, :dependent => :destroy

  attr_accessible :publisher_email, :publisher_name, :date, :status, :done_by
  
  def self.new_pending
    review = Review.new
    review.date = Time.now
    review.status = :pending
    return review
  end
end
