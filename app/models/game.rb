class Game < ActiveRecord::Base
  
  before_validation :convert_playstation, :convert_nes, :convert_snes, :convert_n64, :convert_iphone, :convert_xbox, 
  :convert_gameboy, :convert_gameboy_2, :convert_console, :convert_genre
  
  CONSOLES = ['Atari', 'Nintendo', 'Super Nintendo', 'Nintendo 64', 'Gamecube', 'Wii', 'Wii U', 'Game Boy Color', 'Game Boy Advance', 'Turbo Express',
  'Neo Geo', 'Game Gear', 'Genesis', 'Dreamcast', 'Saturn', 'Playstation', 'Playstation 2', 'Playstation 3', 'Playstation 4', 'Xbox', 'Xbox 360',
  'Xbox One', 'PC', 'IOS', 'Vita']
  
  GENRES = ['Action', 'Action Adventure', 'Action RPG', 'Adventure', 'Arcade', 'Fighting', 'First Person Shooter', 'MMORPG', 'Music', 'Platform', 
  'Platfomer', 'Puzzle','Racing', 'Rail Shooter', 'Role Playing Game', 'RPG', 'Sandbox', 'Shoot-em-up', 'Sim', 'Simulation', 
  'Sports', 'Strategy', 'Survival Horror', 'Tactical RPG', 'Third Person Shooter', 'Tower Defense']

  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites
  
  validates_presence_of :title, :console, :genre, :release_date
  validates :title, uniqueness: true, length: {maximum: 50}
  validates :release_date, length: {is: 4, :message => 'should be 4 numbers'}
  validates_inclusion_of :genre, :in => GENRES
  validates_inclusion_of :console, :in => CONSOLES
  validates_inclusion_of :release_date, :in => (1950..(Time.now.year + 10)), :message => "is not in a logical time range"
  
  def self.all_consoles
    %w(Atari NES SNES N64 Gamecube Wii WiiU Dreamcast Genesis PS PS2 PS3 Xbox Xbox360)
  end
  
  # Conversion methods for user input
  
  def convert_console
	self.console = self.console.titleize unless self.console == ('IOS')
  end
  
  def convert_genre
    self.genre = self.genre.titleize unless self.genre == 'RPG'
  end
  
  def convert_playstation
    self.console = self.console.gsub('ps', 'Playstation')
  end
  
  def convert_nes
    self.console = self.console.gsub('nes', 'Nintendo')
  end
  
  def convert_snes
    self.console = self.console.gsub('snes', 'Super Nintendo')
  end
  
  def convert_n64
    self.console = self.console.gsub('n64', 'Nintendo 64')
  end
  
  def convert_gameboy
    self.console = self.console.gsub('gba', 'Game Boy Advance')
  end
  
  def convert_gameboy_2
    self.console = self.console.gsub('gbc', 'Game Boy Color')
  end
  
  def convert_iphone
    self.console = self.console.gsub('iphone', 'IOS')
  end
  
  def convert_xbox
    self.console = self.console.gsub('Xbox360', 'Xbox 360')
  end
  
end