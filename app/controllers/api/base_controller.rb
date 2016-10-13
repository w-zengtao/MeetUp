module Api
  class BaseController < ActionController::API

    private
    def authenticate_user
      @user = request.env['warden'].authenticate!
    end
  end
end
