class ReviewController < ApplicationController
  
  def index
    @reviews = Review.all
  end
  
  def pending
    @reviews = Review.where(:status => :pending)
    render "index"
  end

  def done
    @reviews = Review.where(:status => :done)
    render "index"
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
        render :text => "You have successfully published your commit for review... It'd better be clean and tested ;)"
      end
    end
  end

end
