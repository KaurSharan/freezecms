class BlogController < ApplicationController
include ApplicationHelper
layout 'main'   
  def blog
    dp
  @users=User.all  

  end
  def check
    dp
  	@us = Blog.new(blog_params)
  	 @users=User.all 
    if @us.valid?
      @us.save 
      @msg = "Blog Saved Successfully" 
  	 render 'blog'
  	else
  		@object=@us.errors.full_messages
  	 render 'blog'
    end
  end
  def blog_params
	 params.require(:blog).permit(:user_id,:title,:detail)  	
  end
   def view
    dp
     @blogs = Blog.all
    @page_title = "Blog"
  end
  def show
    dp
    @user=User.all
    @id = params[:id]
    @us = Blog.find_by_id(@id)
  end
  def delete
    @id = params[:id]
    @us = User.find_by_id(@id)
    if @us.destroy
      redirect_to :action=>'view'
    else
      render 'error'
    end
  end
  def edit
    dp
    @users=User.all
    if params[:id]
          @blogs = Blog.find(params[:id])
  else
    redirect_to :action=>"view"
  end
end
def update
    @blogs = Blog.find(params[:id])
    if @blogs.valid?
        @blogs.update_attributes(blog_params)
        redirect_to :action=> 'edit'
    else
      @object=@us.errors.full_messages
      render 'view'
    end
  end  
end
