class FeedbackController < ApplicationController
include ApplicationHelper
  layout 'main' 
  before_filter :confirm_login   
  def feedback
  	dp
  	 @feedback = Feedback.all
    @page_title = "Feedback"
  end

  def show
    dp
    @id = params[:id]
    @feedback = Feedback.find_by_id(@id)
  end
end
