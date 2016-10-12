class BaseController < ApplicationController
  protect_from_forgery with: :exception
  include ApplicationHelper

  def authenticate_user
    unless current_user
      return redirect_to new_session_path 
    end
  end
end
