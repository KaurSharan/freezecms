class SubmenuController < ApplicationController
include ApplicationHelper
  layout 'main' 
  before_filter :confirm_login 
  def submenu
    dp
    @menu=Menu.all
  end
  def check
    dp
    @us = Submenu.new(menu_params)
    @menu=Menu.all
    @us.valid?
    if @us.save
         @msg = "Sub Menu Saved Successfully"
         redirect_to :action=>'submenu'
    else
      @object=@us.errors.full_messages
     render 'submenu'
    end
    end
    def menu_params
    params.require(:submenu).permit(:menu_id, :name,:link,:position)    
    end
    def view
      dp
     @submenu = Submenu.all
    @page_title = "Sub Menu"
  end
  def show
    dp
    @id = params[:id]
    @us = Submenu.find_by_id(@id)
  end
  def delete
    dp
    @id = params[:id]
    @us = Submenu.find_by_id(@id)
    if @us.destroy
      redirect_to :action=>'view'
    else
      render 'error'
    end
  end
  def edit
    dp
    @menu=Menu.all  
    if params[:id]
    @submenu = Submenu.find(params[:id]) 
  else
    redirect_to :action=>"view"
  end
    def update
      dp
    @submenu = Submenu.find(params[:id])
    if @submenu.valid?
      @submenu.update_attributes(menu_params)
      redirect_to :action=> 'view'
    else
      @object=@us.errors.full_messages
     render 'edit'
      
    end
  end
  end

end
