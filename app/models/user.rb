class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :invitable
  devise :omniauthable, omniauth_providers: %i[facebook google_oauth2 github]
  has_many :articles

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def admin?
    self.has_role? :admin
  end

  # Roles = [ :admin , :default ]

  # def is?( requested_role )
  #   self.role == requested_role.to_s
  # end

end
