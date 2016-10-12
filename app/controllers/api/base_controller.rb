module Api
  class BaseController < ::ApplicationController
    protect_from_forgery with: :null_session

    private
    def authenticate_user
      
    end
  end
end
