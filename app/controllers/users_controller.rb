class UsersController < BaseController

  before_action :set_user, only: [:update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_comfirmation)
  end
end
