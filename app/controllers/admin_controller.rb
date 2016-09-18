class AdminController < ApplicationController
	include ApplicationHelper
 layout 'main' 
  def user
  	dp
  	   if session[:email]
      @uid= session[:id]
      @detail=UserDetail.find_by_user_id(@uid)
  		end
  end		
  def show
    dp
    @id = params[:id]
    @us = UserDetail.find_by_id(@id)
    @prid=session[:id]
    @profile = UserDetail.find_by_id(@prid)
  end
  def edit
    dp
    @users=User.all  
    if session[:id]
      @se=session[:id]
    @userdetail = UserDetail.find(@se) 
  else
    redirect_to :action=>"edit"
  end
    def update
      dp
      @se=session[:id]
    @userdetail=UserDetail.find(@se)
    if @userdetail.valid?
      @userdetail.update_attributes(user_params)
      redirect_to :action=> 'show'
    else
      @object=@us.errors.full_messages
     render 'edit'
      
    end
  end
  end
  def user_params
   params.require(:userdetail).permit(:user_id,:first_name,:last_name,:profile_pic,:number)    
  end
  
end
