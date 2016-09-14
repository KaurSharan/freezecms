class Theme3Controller < ApplicationController
  include ApplicationHelper
layout 'template3' 
  before_filter :confirm_login

  def page3
    pronam
    dp
    searchpage
    @page=Page.all
    @menus=Menu.all
     @back=Background.find(4)
    @users=User.all
    @sliders=Slider.all  
  end

  def searchpage
    
   @menus=Menu.all
   # @page=Page.all
   if params.has_key?(:id)
    @pid=params[:id] 
    else
      @pid = "Home"
  end
    
    @page=Page.find_by_title(@pid)
    @page_title = @page.title
    @back=Background.find(4)
    @users=User.all
    @sliders=Slider.all
    pronam
    render 'page3'
  end
  def pronam
    dp
    if session[:email]
      @session_id=session[:id]
      @proname=Proname.find_by_user_id(@session_id)
     end   
  end


  def logout
    searchpage
  	session[:email] = nil
		session[:id] = nil
		session[:first_name] = nil
		redirect_to :controller=>'public',:action=>'login'
  end
end
