require Rails.root.join('lib/strategies/auth_token_strategy')

# Warden::Manager.serialize_into_session do |user|
#   user.id
# end

Warden::Manager.serialize_from_session do |id|
  User.find_by(auth_token: id['auth_token'])
end
Warden::Strategies.add(:auth_token, AuthTokenStrategy)
