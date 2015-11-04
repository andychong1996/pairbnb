class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :password_digest, presence: true, length: {in: 5..72}
  validates :email, presence: true, uniqueness: true
end
