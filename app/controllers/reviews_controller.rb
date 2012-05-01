class ReviewsController < ApplicationController
  
  def index
    @reviews = Review.order("created_at ASC")
  end
  
  def pending
    @reviews = Review.where(:status => :pending).order("created_at ASC")
    render "index"
  end

  def done
    @reviews = Review.where(:status => :done).order("created_at ASC")
    render "index"
  end
  
  def show
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(:reviewer_id => session[:reviewer].id, :status => :done)
      redirect_to :action => 'pending'
    end
  end
  
  def destroy
    Review.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
  
  def create
    @review = Review.new_pending
    @review.attributes = params[:review]    
    @review.add_commits(params[:commit])
    
    if @review.save
      Reviewer.register_new_publisher_as_reviewer(@review)    
      render :text => "You have successfully published your commit for review to " + reviews_url + "... It'd better be clean and tested ;)"
    else
      render :text => "Could not save your review. Errors are: " << @review.errors.to_a.join(", ")
    end
  end

end
