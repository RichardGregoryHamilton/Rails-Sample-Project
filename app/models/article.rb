class Article < ActiveRecord::Base

 has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://www.space.com/images/i/000/007/138/v_thumb/04_BH_Detect_ALT_VS.jpg?1294438474"
 validates_attachment_content_type :avatar, :content_type => /\Aimage/
 validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\z/]
  
 def to_param
   "#{id} #{title}".parameterize
 end
end
