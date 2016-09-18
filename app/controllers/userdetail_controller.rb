class UserdetailController < ApplicationController
  layout 'main' 
  include ApplicationHelper
  before_filter :confirm_login
  def userdetail
    dp
  	@users=User.all  

  end
  
  def view
    dp
     @userdetail = UserDetail.all
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
        photo = upload(params[:userdetail][:profile_pic])
        if photo
          params[:userdetail][:profile_pic]=photo
          @us = UserDetail.new(user_params)
          @users=User.all 
    if @us.valid?
      @us.save 
      @msg = "User Detail Saved Successfully"
  	 render 'userdetail'
  	else
  		@object=@us.errors.full_messages
  	 render 'userdetail'
    end
   else
      render 'userdetail' 
  end
  end
  def edit
    dp
    @users=User.all  
    if params[:id]
    @userdetail = UserDetail.find(params[:id]) 
  else
    redirect_to :action=>"view"
  end
    def update
      dp
    @userdetail=UserDetail.find(params[:id])
    if @userdetail.valid?
      @userdetail.update_attributes(user_params)
      redirect_to :action=> 'view'
    else
      @object=@us.errors.full_messages
     render 'userdetail'
      
    end
  end
  end
  def user_params
	 params.require(:userdetail).permit(:user_id,:first_name,:last_name,:profile_pic,:number)  	
  end
end
