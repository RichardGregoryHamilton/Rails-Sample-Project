class Game < ActiveRecord::Base
  
  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites
  
  validates_presence_of :title, :console, :genre, :release_date
  validates :title, uniqueness: true, length: {maximum: 50}
  validates :release_date, length: {is: 4}
  validates :console, length: {maximum: 30}
  validates :genre, length: {maximum: 30}
  validates_inclusion_of :release_date, :in => (1950..(Time.now.year + 10)), :message => "is not in a logical time range"
  
  def self.all_consoles
    %w(Atari NES SNES N64 Gamecube Wii WiiU Dreamcast Genesis PS PS2 PS3 Xbox Xbox360)
  end
  
end