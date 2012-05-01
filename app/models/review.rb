class Review < ActiveRecord::Base
  validates :publisher_email, :branch, :presence => true
  validates_associated :commits
  
  has_many :commits, :dependent => :destroy
  
  belongs_to :reviewer

  attr_accessible :publisher_email, :publisher_name, :subject, :branch, :date, :status, :reviewer_id
  
  def add_commits(commits)
    commits.each do |commit|
      self.commits.build(commit)
    end
  end
    
  def self.new_pending
    review = Review.new
    review.date = Time.now
    review.status = :pending
    return review
  end
end
