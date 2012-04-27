class ReviewController < ApplicationController
  
  def index
    @reviews = Review.all
  end
  
  def show
    @review = Review.find(params[:id])
  end
  
  def create
    @review = Review.new_pending
        
    if @review.save    
      @commit = @review.commits.create(params[:commit])
      if @commit.save
        render :text => "You have successfully published your commit for review ;)"
      end
    end

  end
end
