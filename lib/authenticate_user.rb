class AuthenticateUser

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    if user
      { success: true, token: JsonWebToken.encode(user_id: user.id) }
    else
      { success: false, error: 'invalid credentials' }
    end
  end

  private

  attr_accessor :email, :password

  def user
    user = User.find_by_email(email)
    byebug
    return user if user && user.valid_password?(password)
    nil
  end
end
