class User < ApplicationRecord
  has_secure_password

  # validation
  validates :auth_token, uniqueness: true

  # associations
  has_many :meet_ups
  has_many :comments

  # callbacks
  before_validation :ensure_auth_token, on: :create

  # methods
  def refresh_token
    self.auth_token = nil
    ensure_auth_token
    self.save
  end

  private
  def ensure_auth_token
    if auth_token.blank?
      self.auth_token = generate_auth_token
    end
  end

  def generate_auth_token
    loop do
      token = SecureRandom.urlsafe_base64(15).tr('lIO0', 'sxyz')
      break token unless User.where(auth_token: token).first
    end
  end
end
