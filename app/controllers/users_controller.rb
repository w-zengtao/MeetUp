class UsersController < BaseController

  before_action :set_user, only: [:update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user
      sign_in @user
      redirect_to root_path
    else
      redirect_to new_user_path
    end

  end


  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
