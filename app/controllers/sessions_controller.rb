class SessionsController < ApplicationController
  
  def new
  end
  
  def destroy
    session[:reviewer] = nil
    redirect_to reviews_url
  end

  def create
    reviewer = Reviewer.where(:email => params[:session][:email]).first
    
    if reviewer.nil?
      flash.now[:error] = "This email does not belong to a reviewer!"
      render 'new'      
    else
      session[:reviewer] = reviewer
      redirect_to reviews_url
    end
    
  end
  
end
