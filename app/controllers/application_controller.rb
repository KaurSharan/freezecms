class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   protect_from_forgery with: :null_session
  protected 
    def confirm_login
      if session[:email]
        return true
      else
        redirect_to :controller=>'login'
        return false
      end
    end
    def logout
    session[:email] = nil
    session[:id] = nil
    session[:first_name] = nil
    redirect_to :controller=>'public',:action=>'login'
  end
  def dp
       if session[:email]
      @uid= session[:id]
      @detail=UserDetail.find_by_user_id(@uid)
    else
      redirect_to :controller=>'public',:action=>'login'
      end
  end
end
