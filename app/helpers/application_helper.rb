module ApplicationHelper
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  def admin_signed
  	if ((user_signed_in?)&&(current_user.permission==1))
  		return true
  	else
  		return false
  	end
  end
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=40"
    image_tag(gravatar_url, class: "gravatar")
  end
end
