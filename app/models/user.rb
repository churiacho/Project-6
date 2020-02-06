class User < ApplicationRecord

  has_many :activities , dependent: :destroy
  # has_one_attached :avatar
  mount_uploader :avatar, AvatarUploader
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :registerable, :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :registerable, :omniauthable, :omniauth_providers => [:facebook]
  # verify your schema for the additional fields/columns

def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
    end
  end
end

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name
    user.image = auth.info.image
  end
end
end
