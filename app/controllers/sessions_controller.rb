class SessionsController < BaseController

  def create
    user = User.where(name: user_params[:name]).first.try(:authenticate, user_params[:password])
    if user
      sign_in(user)
      redirect_to root_path
    else
      render :new
    end
  end

  def new
  end

  def destroy
    sign_out(current_user)
    redirect_to :back
  end

  private
  def user_params
    params.require(:session).permit(:name, :password, :email)
  end
end
