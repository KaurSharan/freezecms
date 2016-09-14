class MenuController < ApplicationController
include ApplicationHelper
  layout 'main' 
  before_filter :confirm_login 
  def menu
    dp
  end
  def view
    dp
     @menu = Menu.all
    @page_title = "Menus"
  end
  def show
    dp
    @id = params[:id]
    @us = Menu.find_by_id(@id)
  end
  def delete
    dp
    @id = params[:id]
    @us = Menu.find_by_id(@id)
    if @us.destroy
      redirect_to :action=>'view'
    else
      render 'error'
    end
  end
  def edit
    dp
    if params[:id]
    @menu = Menu.find(params[:id])
  else
    redirect_to :action=>"view"
  end
end
def update
  dp
    @menu = Menu.find(params[:id])
    if @menu.valid?
        @menu.update_attributes(menu_params)
        redirect_to :action=> 'view'
    else
      @object=@us.errors.full_messages
      render 'view'
    end
  end
   def check
    dp
  	@us = Menu.new(menu_params)
  	@us.valid?
    if @us.save
    @msg = "Menu Saved Successfully"  
  	 render 'menu'
  	else
  		@object=@us.errors.full_messages
  	 render 'menu'
    end
  	end
  	def menu_params
	 	params.require(:menu).permit(:name,:link,:position)  	
  	end
end
