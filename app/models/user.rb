class User < ApplicationRecord

  has_many :activities , dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :registerable, :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :registerable


end
