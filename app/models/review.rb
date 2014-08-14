class ReviewValidator < ActiveModel::Validator
  
  def validate (review)
    if !review.body.scan(/\d{25}/).empty? || !review.body.scan(/[a-z]{30}/).empty? || !review.body.scan(/\w{30}/).empty? || !review.body.scan(/\W{5}/).empty?
	  review.errors[:body] << "This does not meet our quality standards"
	end
  end
  
end

class Review < ActiveRecord::Base

  include ActiveModel::Validations
  validates_with ReviewValidator
  
  before_validation :delete_words
  
  belongs_to :game
  
  validates_presence_of :username, :body
  
  validates :body, length: {in: 10..2000}
  
  private
  
    def delete_words
	
	  words = ['shpx', 'snttbg', 'chffl', 'cuhpx', 'intvan', 'cravf', 'oybjwbo', 'pbaqbz', 'pbpxfhpx', 'phag', 'cunttbg', 'csunttbg', 'csuhpx','rpfgnpl', 'sipx', 'wvmm', 'znfgheong', 'znevwhnan', 'uvgyre', 'avttn', 'avttre', 'fuvg', 'fyhg', 'obbof', 'anmv', 'ovgpu', 'pnzrygbr', 'qvyqb', 'syrfuyvtug', 'sngnff', 'unaqwbo', 'gvgwbo', 'whatyrohaal', 'yneqnff', 'dhrrs', 'dhrre', 'evzwbo', 'evz wbo', 'nffubyr', 'nffshpx', 'nffyvpx', 'nffjvcr', 'nffjuber', 'ovngpu', 'pnzrywbpxrl', 'pureelcbc', 'pbpxevqr', 'qvpxevqr', 'svfgvat', 'tnatonat', 'tnlfrk', 'tvirurnq', 'betnfz', 'cnagvrf',
	'cbea', 'chffvrf', 'frkgbl', 'fgencba', 'gnzcba', 'grfgvpyr', 'genaffrkhny', 'gjvax', 'nffxvff', 'nffpybja', 'nffxybja', 'onyyfnpx', 'onerylyrtny', 'orfgvnyvgl', 'ovtgvgf', 'ovtpbpx', 'ovtqvpx', 'ovfrkhny', 'olngpu', 'pnecrgzhapure', 'pbpnvar', 'pbpxoybpx', 'pbvghf', 'pebgpu', 'phavyyvathf', 'qrrcguebng', 'qrsrpngr', 'qvatyroreel', 'qbttlfglyr', 'qbttvrfglyr', 'qentdhrra', 'sbbgyvpx', 'sbaqyr', 'oybbq sneg', 'oybbqsneg', 'shtyl', 'travgny', 'tynmrqqbahg', 'tbyqrafubjre', 'thoon', 'unznf', 'ubzbfrk', 'vagreenpvny', 'xbaqhz', 'xhavyvathf', 'yncqnapr', 'ync qnapr', 'yrmmb', 'yvzcqvpx', 'ybirobar',
	'ybirtha', 'ybirwhvpr', 'ybircvfgby', 'ybirebpxrg', 'ybirzhfpyr', 'zvys', 'zbpxrl', 'zbpxvr', 'zbarlfubg', 'zbfyrz', 'zhssqvir', 'zhssyvpx', 'nff xvff', 'orneqrqpynz', 'orneqrqgnpb', 'orneqrq pynz', 'orneqrq gnpb', 'nff pybja', 'nff xybja', 'onyy fnpx', 'ovt gvgf', 'ovt pbpx', 'ovt qvpx', 'pnecrg zhapure', 'pbpx oybpx', 'qrrc guebng', 'qbttl fglyr', 'qbttvr fglyr', 'qent dhrra', 'sbbg yvpx', 'tynmrq qbahg', 'tbyqra fubjre', 'ybir obar', 'ybir tha', 'ybir whvpr', 'ybir cvfgby', 'ybir ebpxrg', 'ybir zhfpyr', 'zhss qvir', 'zhss yvpx', 'pBaqbz', 'ulzra', 'vagrepbhefr', 'wrexbss', 'yhorwbo', 'cvff',
	'dhvpxvr', 'nany', 'betl', 'ovzob', 'fcrez', 'grfgvrf', 'guerrfbzr', 'oyrjvafxv', 'pubxvat gur puvpxra', 'sbhefbzr', 'oyhronyy', 'oyhr onyy', 'obare', 'phmr', 'qnatryoreel', 'qharpbba', 'qhar pbba', 'qnatyroreel', 'qrrm ahgf', 'qenva gur yvmneq', 'rneavat erq jvatf', 'srygpu', 'svatreonat','svatre onat', 'sybttvat gur ovfubc', 'she ohetre', 'sheohtre', 'shqtr cnpxre', 'shqtrcnpxre', 'tnat onat', 'tavtn', 'unvel ungpurg jbhaq', 'unvel gnpb', 'unvelgnpb', 'xbbpu', 'xbbgpu', 'yrgghpr cvpxre', 'yrgghprcvpxre', 'ybir pnany', 'zhq crbcyr', 'zhq crefba', 'zhqcrbcyr', 'zhqcrefba', 'avccyr', 'cvyybj ovgre',
	'cvyybjovgre', 'cvcr uvggre', 'cvcruvggre', 'cbyr fvggre', 'cbyrfvggre', 'cbyr fzbxre', 'cbyrfzbxre', 'cbyvfuvat gur gbecrqb', 'cbyvfuvatgurgbecrqb', 'fcnax gur zbaxrl', 'fcnaxgurzbaxrl', 'fzrtzn', 'fxva syhgr', 'fxvasyhgr', 'fync gur fnynzv', 'fyncgurfnynzv', 'fpehoovat gur pneebg', 'fpehoovatgurpneebg', 'ehzc enatre', 'ehzcenatre', 'ehzc funxre', 'ehzcfunxre', 'fpuybat']
	
      aw = (words + words.map(&:capitalize) + words.map(&:downcase)).map{|word|word.tr("A-Za-z", "N-ZA-Mn-za-m")}
	  
	  word_list = aw.map{|word|word.gsub(/[AEGIOSTaegiost]/, 'A' => '4', 'E' => '3', 'G' => '6', 'I' => '!', 'O' => '0', 'S' => '5', 'T' => '7', 'a' => '4', 'e' => '3',
	'g' => '6', 'i' => '!', 'o' => '0', 's' => '5', 't' => '7')} + aw.map{|w|w.gsub('a', '4')} + aw.map{|w|w.sub('a', '4')} + aw.map{|w|w.gsub('e', '3')} +
	aw.map{|w|w.sub('e', '3')} + aw.map{|w|w.gsub('g', '6')} + aw.map{|w|w.sub('g', '6')} + aw.map{|w|w.gsub('i', '!')} + aw.map{|w|w.gsub('o', '0')} +
	aw.map{|w|w.sub('o', '0')} + aw.map{|w|w.gsub('s', '5')} + aw.map{|w|w.sub('s', '5')} + aw.map{|w|w.gsub('t', '7')} + aw.map{|w|w.sub('t', '7')}
	
	word_list.each { |word| self.body.gsub!(word, '') }
	
	end
	
end