require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Meetup
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.middleware.insert_after ActionDispatch::Session::CookieStore, Warden::Manager do |manager|
      manager.default_strategies :auth_token
      manager.failure_app = Api::UnauthorizedController
    end
  end
end
