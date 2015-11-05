class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :password_digest, presence: true, length: {in: 5..72}
  validates :email, presence: true, uniqueness: true

  def self.from_omniauth(auth)
  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name
    user.user_name = auth.extra.raw_info.username
    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save!
  end
end
end
