class User < ApplicationRecord
  has_secure_password

  # validation
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: EMAIL_REGEX }
  validates :auth_token, uniqueness: true, presence: true

  # associations
  has_many :meet_ups
  has_many :comments

  # callbacks
  before_create :ensure_auth_token
  def ensure_auth_token
    if auth_token.blank?
      self.auth_token = generate_auth_token
    end
  end

  private
  def generate_auth_token
    loop do
      token = SecureRandom.urlsafe_base64(15).tr('lIO0', 'sxyz')
      break token unless User.where(auth_token: token).first
    end
  end
end
