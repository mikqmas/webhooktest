class User < ApplicationRecord

  validates :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    user.try(:is_password?, password) ? user : nil
  end

  def is_password?(password)
    BCrypt::Password.create(password).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
