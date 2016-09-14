class UserController < ApplicationController
  layout 'main'
  include ApplicationHelper
  before_filter :confirm_login
  def user
   dp
  end
    def view
      dp
     @users = User.all
    @page_title = "Users"
  end
  def show
    dp
    @id = params[:id]
    @us = User.find_by_id(@id)
  end
  def delete
    dp
    @id = params[:id]
    @us = User.find_by_id(@id)
    if @us.destroy
      redirect_to :action=>'view'
    else
      render 'error'
    end
  end
  def check
    dp
  	@us = User.new(user_params)
  	@us.valid?
    if @us.save
      @msg = "User Saved Successfully"
  	 render 'user'
  	else
  		@object=@us.errors.full_messages
  	 render 'user'
    end
  end
  def user_params
	return params.require(:user).permit(:email,:password,:is_admin,:is_active)  	
  end

  def edit
    dp
    if params[:id]
    @user = User.find(params[:id])
    else
      redirect_to :action => 'view'
    end
    
  end
  def update
    dp
    @user=User.find(params[:id])
    if @user.valid?
      @user.update_attributes(user_params)
       @msg = "User Saved Successfully"
      redirect_to :action=> 'edit'
    else
      @object=@us.errors.full_messages
     render 'user'
      
    end
  end
end
