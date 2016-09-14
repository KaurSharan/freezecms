class UserDetailController < ApplicationController
layout 'main' 
  include ApplicationHelper
  before_filter :confirm_login
  def user_detail
    dp
  	@users=User.all  

  end
  
  def view
    dp
     @user_detail = UserDetail.all
    @page_title = "Users Detail"

  end
  def show
    dp
    @id = params[:id]
    @us = UserDetail.find_by_id(@id)
    # @prid=session[:id]
    # @profile = UserDetail.find_by_id(@prid)
  end
  def delete
    dp
    @id = params[:id]
    @us = UserDetail.find_by_id(@id)
    if @us.destroy
      redirect_to :action=>'view'
    else
      render 'error'
    end
  end
  def check
      dp  	  
        photo = upload(params[:user_detail][:profile_pic])
        if photo
          params[:user_detail][:profile_pic]=photo
          @us = UserDetail.new(user_params)
          @users=User.all 
    if @us.valid?
      @us.save 
      @msg = "User Detail Saved Successfully"
  	 render 'user_detail'
  	else
  		@object=@us.errors.full_messages
  	 render 'user_detail'
    end
   else
      render 'user_detail' 
  end
  end
  def edit
    dp
    @users=User.all  
    if params[:id]
    @user_detail = UserDetail.find(params[:id]) 
  else
    redirect_to :action=>"view"
  end
    def update
      dp
    @user_detail=UserDetail.find(params[:id])
    if @user_detail.valid?
      @user_detail.update_attributes(user_params)
      redirect_to :action=> 'view'
    else
      @object=@us.errors.full_messages
     render 'user_detail'
      
    end
  end
  end
  def user_params
	 params.require(:user_detail).permit(:user_id,:first_name,:last_name,:profile_pic,:number)  	
  end
end
