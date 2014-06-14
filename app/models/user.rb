class User < ActiveRecord::Base
  
  has_many :favorite_games
  has_many :favorites, through: :favorite_games
  
  has_secure_password
  before_create :create_remember_token
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
  validates_presence_of :name, :password, :email
  validates_uniqueness_of :name, :email
  validates :name, length: { maximum: 20 }
  validates :password, length: { minimum: 6 }
  validates :email, format: { with: VALID_EMAIL_REGEX }
  
  validates_confirmation_of :password, if: lambda { |m| m.password.present? }
  
  
  # Adding Security
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  private
  
  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
  
end