class User < ActiveRecord::Base
  has_many :favorite_games
  has_many :favorites, through: :favorite_games
  
  has_secure_password
  before_create :create_remember_token
  
  validates_presence_of :name, :password, :email
  validates_uniqueness_of :name, :email
  validates :password, length: {minimum: 6}
  validates_confirmation_of :password, if: lambda { |m| m.password.present? }
  
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
