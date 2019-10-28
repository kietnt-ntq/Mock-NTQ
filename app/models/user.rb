class User < ApplicationRecord
  before_save :downcase_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :validatable,:omniauthable, :omniauth_providers => [:google_oauth2]

  has_many :contents
  has_many :roles, :dependent => :destroy
  has_many :groups, through: :roles
  has_many :attendances
  
  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
          user.fullname = auth.info.name
          user.pictures = auth.info.image
          user.givenname = auth.info.first_name
          user.save
      end
  end

  private
  # Converts email to all lower-case.
  def downcase_email
    self.email = email.downcase
  end

end
