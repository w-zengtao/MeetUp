Rails.application.config.middleware.use Warden::Manager do |manager|
  manager.default_strategies :api
end

Warden::Strategies.add(:api) do
  def valid?
    params[:user_token]
  end

  def authenticate!

  end
end
