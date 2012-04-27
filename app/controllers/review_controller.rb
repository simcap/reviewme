class ReviewController < ApplicationController
  
  def index
    @reviews = Review.all
  end
  
  def show
    @review = Review.find(params[:id])
  end
  
  def create
    @review = Review.new
    @review.date = Time.now
    @review.status = :pending
    
    if @review.save    
      @commit = @review.commits.create(params[:commit])
      if @commit.save
        redirect_to @review
      end
    end

  end
end
