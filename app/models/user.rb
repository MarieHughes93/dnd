class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :recoverable, :rememberable, :lockable, :timeoutable, :trackable and 
  devise :database_authenticatable, :registerable, :validatable, :omniauthable, omniauth_providers: [:github]
  


  def self.create_from_provider_data(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.name = auth.info.name
      user.uid = auth.uid
      user.username = auth.info.nickname
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
