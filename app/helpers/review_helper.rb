module ReviewHelper
  
  def review_done?(review)
    review.status == :done.to_s
  end
  
end
