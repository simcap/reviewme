module SessionsHelper
  
  def signed_in?
    session[:email]
  end

end
