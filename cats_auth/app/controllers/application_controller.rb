class ApplicationController < ActionController::Base
  def login!(user)
    sessions[:session_token] = user.reset_session_token!
    
  end


end
