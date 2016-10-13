module Api
  class SessionsController < BaseController

    before_action :authenticate_user, only: [:destroy]

    def new
      render json: { status: 301 }
    end

    def create
      user = User.where(name: params[:name]).first.try(:authenticate, params[:password])
      if user
        render json: { user: { id: user.id, auth_token: user.auth_token}, status: 200 }
      else
        render json: { status: 404 }
      end
    end

    def destroy
      @user.refresh_token
      render json: { user: {id: @user.id} }
    end

  end
end
