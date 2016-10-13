class AuthTokenStrategy < ::Warden::Strategies::Base
  def valid?
    auth_token
  end

  def authenticate!
    user = User.find_by(auth_token: auth_token)
    user.nil? ? fail!('strategies.auth_token.failed') : success!(user)
  end

  private
  def auth_token
    params['auth_token']
  end
end
