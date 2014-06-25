class User < ActiveRecord::Base
  
  has_many :favorites, foreign_key: "user_id", dependent: :destroy
  has_many :games, through: :favorites
    
  has_secure_password
  before_create :create_remember_token
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
  validates_presence_of :name, :password, :email
  validates_uniqueness_of :name, :email
  validates_uniqueness_of :game, :on => :update
  validates :name, length: { in: 3..20 }
  validates :password, length: { minimum: 6 }
  validates :email, format: { with: VALID_EMAIL_REGEX }, length: { in: 8..50 }
  
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