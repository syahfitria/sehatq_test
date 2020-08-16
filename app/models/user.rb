class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :lockable, :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :book_doctors

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
      generated_password = Devise.friendly_token[0,20]

      user = User.create(
        email: data['email'],
        password: generated_password,
        password_confirmation: generated_password
      )
    end

    user
  end

  def self.generate_token
    return SecureRandom.hex
  end
end
