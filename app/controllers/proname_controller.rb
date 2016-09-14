class PronameController < ApplicationController
include ApplicationHelper
  layout 'main' 
  before_filter :confirm_login   
  def proname
    dp
  @user=User.all  

  end
  def check
    dp
  	@us = Proname.new(user_params)
  	 @user=User.all 
    if @us.valid?
      @us.save 
      @msg = "proname Saved Successfully" 
  	 render 'proname'
  	else
  		@object=@us.errors.full_messages
  	 render 'proname'
    end
  end
  def user_params
	 params.require(:proname).permit(:user_id,:name)  	
  end
   def view
    dp
     @proname = Proname.all
    @page_title = "Project Name"
  end
  def show
    dp
    @id = params[:id]
    @us = Proname.find_by_id(@id)
  end
  def delete
    dp
    @id = params[:id]
    @us = Proname.find_by_id(@id)
    if @us.destroy
      redirect_to :action=>'view'
    else
      render 'error'
    end
  end
  def edit
    dp
    @user=User.all
    if params[:id]
    @proname = Proname.find(params[:id])
  else
    redirect_to :action=>"view"
  end
end
def update
  dp
    @proname = Proname.find(params[:id])
    if @proname.valid?
        @proname.update_attributes(user_params)
        redirect_to :action=> 'view'
    else
      @object=@us.errors.full_messages
      render 'view'
    end
  end
    
end
