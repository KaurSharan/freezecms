class BannerController < ApplicationController
 include ApplicationHelper
  layout 'main' 
  before_filter :confirm_login 
  def banner
    dp
  @page=Page.all
  end
  def check
    dp
  	@us = Banner.new(menu_params)
      @page=Page.all
  	
    if @us.valid?
    	@us.save
      @msg = "Banner Saved Successfully"    
  	 render 'banner'
  	else
  		@object=@us.errors.full_messages
  	 render 'banner'
    end
  	end
  	def menu_params
	 	params.require(:banner).permit(:page_id,:banner_type,:detail)  	
  	end
    def view
      dp
     @banner = Banner.all
    @page_title = "Banner"
  end
  def show
    dp
    @id = params[:id]
    @us = Banner.find_by_id(@id)
  end
  def delete
    dp
    @id = params[:id]
    @us = Banner.find_by_id(@id)
    if @us.destroy
      redirect_to :action=>'view'
    else
      render 'error'
    end
  end
  def edit
    dp
    @page=Page.all  
    if params[:id]
      @banner = Banner.find(params[:id]) 
    else
      redirect_to :action=>"view"
    end
  end
  def update
    dp
    @banner = Banner.find(params[:id])
    if @banner.valid?
        @banner.update_attributes(menu_params)
        redirect_to :action=> 'view'
    else
      @object=@us.errors.full_messages
      render 'edit'
    end
  end
end
