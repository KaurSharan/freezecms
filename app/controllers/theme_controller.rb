class ThemeController < ApplicationController
  include ApplicationHelper
layout 'template' 
  before_filter :confirm_login

  def page
    pronam
    dp
    searchpage
    @page=Page.all
    @menus=Menu.all
     @back=Background.find(2)
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
    @back=Background.find(2)
    @users=User.all
    @sliders=Slider.all
    pronam
    render 'page'
  end
  def pronam
    dp
    if session[:email]
      @session_id=session[:id]
      @proname=Proname.find_by_name(@session_id)
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
