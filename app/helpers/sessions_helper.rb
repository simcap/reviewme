module SessionsHelper
  
  def signed_in?
    session[:reviewer]
  end

end
