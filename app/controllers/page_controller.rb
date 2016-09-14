class PageController < ApplicationController
include ApplicationHelper
  layout 'main' 
  before_filter :confirm_login 
  def page
    dp
    @submenu=Submenu.all
    @banner=Banner.all
  end
  def check
    dp
  	@us = Page.new(submenu_params)
     @submenu=Submenu.all
    @banner=Banner.all
  	@us.valid?
    if @us.save
     @msg = "Pages Saved Successfully"
  	 render 'page'
  	else
  		@object=@us.errors.full_messages
  	 render 'page'
    end
  	end
  	def submenu_params
	 	params.require(:page).permit(:submenu_id,:banner_id,:title,:description)  	
  	end
    def view
      dp
     @page = Page.all
    @page_title = "Page"
  end
  def show
    dp
    @id = params[:id]
    @page = Page.find_by_id(@id)
  end
  def delete
    dp
    @id = params[:id]
    @us = Page.find_by_id(@id)
    if @us.destroy
      redirect_to :action=>'view'
    else
      render 'error'
    end
  end
    def edit
      dp
    @submenu=Submenu.all
    @banner=Banner.all  
    if params[:id]
      @page = Page.find_by_id(params[:id]) 
    else
      redirect_to :action=>"view"
    end
  end
  def update
    dp
    @page = Page.find(params[:id])
    if @page.valid?
        @page.update_attributes(submenu_params)
        redirect_to :action=> 'view'
    else
      @object=@us.errors.full_messages
      render 'edit'
    end
  end
end
