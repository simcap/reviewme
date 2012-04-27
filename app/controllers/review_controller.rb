class ReviewController < ApplicationController
  
  def index
    @reviews = Review.where(:status => :pending)
  end
  
  def show
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(:done_by => params[:done_by], :status => :done)
      redirect_to :action => 'index'
    end
  end
  
  def destroy
    Review.find(params[:id]).destroy
    redirect_to :action => 'index'
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
