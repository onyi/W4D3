class User < ApplicationRecord

  attr_reader :password
  
  validates :user_name, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true

  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    # this will save hashed password to password_digest
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    # change the class of password_digest to BCrypt object
    hashed_password = BCrypt::Password.new(self.password_digest)

    # compare with argument using BCrypt built-in method
    hashed_password.is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)

    if user
      is_password?(password) ? user : nil
    else # when there is no user with user_name
      nil
    end
  end

end
