class SelectController < ApplicationController
  include ApplicationHelper
layout 'sel' 
  before_filter :confirm_login

  def select
  	dp
  end
end
