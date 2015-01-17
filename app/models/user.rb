class MyValidator < ActiveModel::Validator

  def mystery_setup
  
    @mystery_words = ['shpx', 'snttbg', 'chffl', 'cuhpx', 'intvan', 'cravf', 'oybjwbo', 'pbaqbz', 'pbpxfhpx', 'phag', 'cunttbg', 'csunttbg', 'csuhpx', 'rpfgnpl', 'sipx', 'wvmm', 'znfgheong', 'znevwhnan', 'uvgyre', 'avttn', 'avttre', 'fuvg', 'fyhg', 'obbof', 'anmv', 'ovgpu', 'pnzrygbr', 'qvyqb',
	'syrfuyvtug', 'sngnff', 'unaqwbo', 'gvgwbo', 'whatyrohaal', 'yneqnff', 'dhrrs', 'dhrre', 'evzwbo', 'evz wbo', 'nffubyr', 'nffshpx', 'nffyvpx', 'nffjvcr', 'nffjuber', 'ovngpu', 'pnzrywbpxrl', 'pureelcbc', 'pbpxevqr', 'qvpxevqr', 'svfgvat', 'tnatonat', 'tnlfrk', 'tvirurnq', 'betnfz', 'cnagvrf',
	'cbea', 'chffvrf', 'frkgbl', 'fgencba', 'gnzcba', 'grfgvpyr', 'genaffrkhny', 'gjvax', 'nffxvff', 'nffpybja', 'nffxybja', 'onyyfnpx', 'onerylyrtny', 'orfgvnyvgl', 'ovtgvgf', 'ovtpbpx', 'ovtqvpx', 'ovfrkhny', 'olngpu', 'pnecrgzhapure', 'pbpnvar', 'pbpxoybpx', 'pbvghf', 'pebgpu', 'phavyyvathf',
	'qrrcguebng', 'qrsrpngr', 'qvatyroreel', 'qbttlfglyr', 'qbttvrfglyr', 'qentdhrra', 'sbbgyvpx', 'sbaqyr', 'oybbq sneg', 'oybbqsneg', 'shtyl', 'travgny', 'tynmrqqbahg', 'tbyqrafubjre', 'thoon', 'unznf', 'ubzbfrk', 'vagreenpvny', 'xbaqhz', 'xhavyvathf', 'yncqnapr', 'ync qnapr', 'yrmmb', 'yvzcqvpx', 'ybirobar',
	'ybirtha', 'ybirwhvpr', 'ybircvfgby', 'ybirebpxrg', 'ybirzhfpyr', 'zvys', 'zbpxrl', 'zbpxvr', 'zbarlfubg', 'zbfyrz', 'zhssqvir', 'zhssyvpx', 'nff xvff', 'orneqrqpynz', 'orneqrqgnpb', 'orneqrq pynz', 'orneqrq gnpb', 'nff pybja', 'nff xybja', 'onyy fnpx', 'ovt gvgf', 'ovt pbpx', 'ovt qvpx', 'pnecrg zhapure',
	'pbpx oybpx', 'qrrc guebng', 'qbttl fglyr', 'qbttvr fglyr', 'qent dhrra', 'sbbg yvpx', 'tynmrq qbahg', 'tbyqra fubjre', 'ybir obar', 'ybir tha', 'ybir whvpr', 'ybir cvfgby', 'ybir ebpxrg', 'ybir zhfpyr', 'zhss qvir', 'zhss yvpx', 'pBaqbz', 'ulzra', 'vagrepbhefr', 'wrexbss', 'yhorwbo', 'cvff',
	'dhvpxvr', 'nany', 'betl', 'ovzob', 'fcrez', 'grfgvrf', 'guerrfbzr', 'oyrjvafxv', 'pubxvat gur puvpxra', 'sbhefbzr', 'oyhronyy', 'oyhr onyy', 'obare', 'phmr', 'qnatryoreel', 'qharpbba', 'qhar pbba', 'qnatyroreel', 'qrrm ahgf', 'qenva gur yvmneq', 'rneavat erq jvatf', 'srygpu', 'svatreonat','svatre onat',
	'sybttvat gur ovfubc', 'she ohetre', 'sheohtre', 'shqtr cnpxre', 'shqtrcnpxre', 'tnat onat', 'tavtn', 'unvel ungpurg jbhaq', 'unvel gnpb', 'unvelgnpb', 'xbbpu', 'xbbgpu', 'yrgghpr cvpxre', 'yrgghprcvpxre', 'ybir pnany', 'zhq crbcyr', 'zhq crefba', 'zhqcrbcyr', 'zhqcrefba', 'avccyr', 'cvyybj ovgre',
	'cvyybjovgre', 'cvcr uvggre', 'cvcruvggre', 'cbyr fvggre', 'cbyrfvggre', 'cbyr fzbxre', 'cbyrfzbxre', 'cbyvfuvat gur gbecrqb', 'cbyvfuvatgurgbecrqb', 'fcnax gur zbaxrl', 'fcnaxgurzbaxrl', 'fzrtzn', 'fxva syhgr', 'fxvasyhgr', 'fync gur fnynzv', 'fyncgurfnynzv', 'fpehoovat gur pneebg', 'fpehoovatgurpneebg',
	'ehzc enatre', 'ehzcenatre', 'ehzc funxre', 'ehzcfunxre', 'fpuybat']
	
    @mysteries = (@mystery_words + @mystery_words.map(&:capitalize) + @mystery_words.map(&:upcase)).map{|mystery|mystery.tr("A-Za-z", "N-ZA-Mn-za-m")}
	
	@mysteries_sub = @mysteries.map{|m|m.gsub(/[AEGIOSTaegiost]/, 'A' => '4', 'E' => '3', 'G' => '6', 'I' => '!', 'O' => '0', 'S' => '5', 'T' => '7', 'a' => '4',
	'e' => '3', 'g' => '6', 'i' => '!', 'o' => '0', 's' => '5', 't' => '7')} + @mysteries.map{|m|m.gsub('a', '4')} + @mysteries.map{|m|m.sub('a', '4')} +
	@mysteries.map{|m|m.gsub('e', '3')} + @mysteries.map{|m|m.sub('e', '3')} + @mysteries.map{|m|m.gsub('g', '6')} + @mysteries.map{|m|m.sub('g', '6')} +
	@mysteries.map{|m|m.gsub('i', '!')} + @mysteries.map{|m|m.sub('i', '!')} + @mysteries.map{|m|m.gsub('o', '0')} + @mysteries.map{|m|m.sub('o', '0')} +
	@mysteries.map{|m|m.gsub('s', '5')} + @mysteries.map{|m|m.sub('s', '5')} + @mysteries.map{|m|m.gsub('t', '7')} + @mysteries.map{|m|m.sub('t', '7')}
	
	@characters_array = (0..9).to_a.map(&:to_s) + ["!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "+", "=", ",", ".", "?", "/", ":", ";"]
	
	@mysteries_sym = @characters_array.flat_map do |character|
	  @mysteries.map {|mystery| mystery.gsub(' ', character)}
	end
	
	@mystery_book = (@mysteries + @mysteries_sub + @mysteries_sym).uniq
	
  end
  
  def validate (user)
    mystery_setup
    unless User.all.include?(user)
      if user.name && user.email && user.password
        if @mystery_book.any? {|m|user.name.include?(m)} || @mystery_book.any?{|m|user.email.include?(m)} || @mystery_book.any?{|m|user.password.include?(m)}
          user.errors[:name] << 'Error: Please select a different username'
        end
      end
    end
  end
  
end

class User < ActiveRecord::Base

  include ActiveModel::Validations
  validates_with MyValidator
  # after_save :date_conversion
  
  has_many :favorites, foreign_key: "user_id", dependent: :destroy
  has_many :games, through: :favorites
    
  has_secure_password
  before_create :create_remember_token
  
  VALID_DATE_REGEX = /\A(([1-9]|1[012])[-\/.]([1-9]|[12][0-9]|3[01])[-\/.](19|20)\d\d)|((1[012]|0[1-9])(3[01]|2\d|1\d|0[1-9])(19|20)\d\d)|((1[012]|0[1-9])[-\/](3[01]|2\d|1\d|0[1-9])[-\/](19|20)\d\d)\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates_presence_of :name, :password, :email, :on => :create
  validates_uniqueness_of :name, :email
  validates :name, length: { in: 3..20 }
  validates :password, length: { minimum: 6 }, :on => :create
  validates :email, format: { with: VALID_EMAIL_REGEX }, length: { in: 8..50 }
  # validates :birthday, format: { with: VALID_DATE_REGEX }, :on => :update
  
  validates_confirmation_of :password, if: lambda { |m| m.password.present? }
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  private
  
  def date_conversion
    self.birthday = self.birthday.gsub('/', '-') if self.birthday
  end
  
  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
  
end