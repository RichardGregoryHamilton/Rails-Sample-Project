module ApplicationHelper
  
  # Sort Table Data either Ascending or Descending
  
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
  
  # Create avatar for user
  
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
  
  # Calculate Member Time in days
  
  def member_for
    ((Time.now - @user.created_at)/86400).floor
  end
  
  # Calculate a User's age
  
  def user_age
    Time.now.year - (@user.birthday.split(/[-\/.]/).rotate(-1).join('-').to_date.year) if @user.birthday
  end
 
end
