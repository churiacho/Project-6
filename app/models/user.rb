class User < ApplicationRecord
  attr_accessor :login
  # "getter"
  # def login
  #   @login
  # end

  # "setter"
  # def login=(str)
  #   @login = str
  # end
  validate :validate_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  has_many :activities , dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :registerable, :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :registerable

  # def self.find_for_database_authentication warden_condition
  #   conditions = warden_condition.dup
  #   if login = conditions.delete(:login).downcase
  #     where(conditions).where('$or' => [ {:username => /^#{Regexp.escape(login)}$/i}, {:email => /^#{Regexp.escape(login)}$/i} ]).first
  #   else
  #     where(conditions).first

  #   end
  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ["lower(username) = :value OR lower(email) = :value",
      { value: login.strip.downcase}]).first

  end
end
