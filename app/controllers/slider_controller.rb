class SliderController < ApplicationController
include ApplicationHelper
  layout 'main' 
  before_filter :confirm_login
  def slider
    dp
    @page=Page.all
  end
  
  def check
    dp
    @page=Page.all
     photo = upload(params[:slider][:pic])
    if photo
          params[:slider][:pic]=photo  
              @slider = Slider.all
              
      @us = Slider.new(menu_params)
    if @us.valid?
      @us.save

  	redirect_to :action=>"slider"
  	else
  		@object=@us.errors.full_messages
  	 render 'slider'
    end
  end
  	end
  	def menu_params
	 return	params.require(:slider).permit(:page_id,:pic)  	
  	end
    def view
      dp
     @slider = Slider.all
    @page_title = "Slider"
  end
  def show
    dp
    @id = params[:id]
    @us = Slider.find_by_id(@id)
  end
  def delete
    dp
    @id = params[:id]
    @us = Slider.find_by_id(@id)
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
      @slider = Slider.find(params[:id]) 
    else
      redirect_to :action=>"view"
    end
  end
  def update
    dp
    @slider = Slider.find(params[:id])
    if @slider.valid?
        @slider.update_attributes(menu_params)
        redirect_to :action=> 'view'
    else
      @object=@slider.errors.full_messages
      render 'edit'
    end
  end
end
