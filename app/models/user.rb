class User < ActiveRecord::Base

  has_secure_password

  has_many :listings

  mount_uploader :avatar, AvatarUploader

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_digest, presence: true, length: {in: 5..72}
  validates :email, presence: true, uniqueness: true

  def self.from_omniauth_facebook(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.password = SecureRandom.hex
      user.email =  auth.info.email
      user.oauth_token = auth.credentials.token
    end
end
end
