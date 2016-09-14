class BackgroundController < ApplicationController
  include ApplicationHelper
  layout 'main' 
  before_filter :confirm_login
  def background
    dp
   @page=Page.all
  end
  def check
     dp 
  	 photo = upload(params[:background][:photo])
        if photo
          params[:background][:photo]=photo
      @page = Page.all
      @us = Background.new(background_params)

      if @us.valid?
        @us.save
        @msg = "Background Saved Successfully"
    	 render 'background'
    	else
    		@object=@us.errors.full_messages
    	 render 'background'
      end
   else
      @test="Select Image Only..."
  end  
    
  end
  	def background_params
	 	params.require(:background).permit(:page_id,:photo)  	
  	end
    def view
      dp
     @background = Background.all
    @page_title = "Background"
  end
  def show
    dp
    @id = params[:id]
    @us = Background.find_by_id(@id)
  end
  def delete
    dp
    @id = params[:id]
    @us = Background.find_by_id(@id)
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
    @background = Background.find(params[:id]) 
  else
    redirect_to :action=>"view"
  end
end
    def update
      dp
    @background = Background.find(params[:id])
    if @background.valid?
      @background.update_attributes(background_params)
      redirect_to :action=> 'view'
    else
      @object=@us.errors.full_messages
     render 'edit'
      
    end
  end

end
