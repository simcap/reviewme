class Review < ActiveRecord::Base
  validate :maximum_number_of_commits_per_review
  validates :publisher_email, :branch, :presence => true  
  
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
  
  def errors_to_text
    text = "Review:\n"
    self.errors.each { |attr, msg|
      text << "- #{attr} #{msg}\n" unless msg.include? "is invalid"  
    }
    self.commits.each_with_index { |commit, index|
      if(not commit.errors.empty?)
        text << "Commit #{index}:\n"
        commit.errors.each { |attr, msg|
          text << "- #{attr} #{msg}\n"   
        }
      end
    }
    return text
  end
  
  def maximum_number_of_commits_per_review
    if self.commits.size > 5
      errors.add(:commits, "maximum of 5 per review")
    end
  end
  
end
