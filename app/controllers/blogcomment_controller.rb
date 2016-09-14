class BlogcommentController < ApplicationController
layout 'main'   
  def blogcomment
    dp
  @blogs=Blog.all  

  end
  def check
    dp
  	@us = Blogcomment.new(blog_params)
  	 @blogs=Blog.all 
    if @us.valid?
      @us.save 
      @msg = "Comment Saved Successfully" 
  	 render 'blogcomment'
  	else
  		@object=@us.errors.full_messages
  	 render 'blogcomment'
    end
  end
  def blog_params
	 params.require(:blogcomment).permit(:blog_id,:comment)  	
  end
   def view
    dp
     @blogcomment = Blogcomment.all
    @page_title = "Blog Comment"
  end
  def show
    dp
    @id = params[:id]
    @us = Blogcomment.find_by_id(@id)
  end
  def delete
    @id = params[:id]
    @us = Blogcomment.find_by_id(@id)
    if @us.destroy
      redirect_to :action=>'view'
    else
      render 'error'
    end
  end
  def edit
    dp
    @blogs=Blog.all
    if params[:id]
    @blogcomment = Blogcomment.find(params[:id])
  else
    redirect_to :action=>"view"
  end
end
def update
    @blogcomment = Blogcomment.find(params[:id])
    if @blogcomment.valid?
        @blogcomment.update_attributes(blog_params)
        redirect_to :action=> 'edit'
    else
      @object=@us.errors.full_messages
      render 'view'
    end
  end  
end
