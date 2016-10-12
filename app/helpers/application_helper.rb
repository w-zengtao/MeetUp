module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out(user)
    session[:user_id] = nil
    @current_user = nil
  end
end
