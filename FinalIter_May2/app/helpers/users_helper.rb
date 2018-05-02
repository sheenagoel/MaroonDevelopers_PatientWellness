module UsersHelper
  
  # Returns the Gravatar for the given user.
  def gravatar_for(user, options = { size: 80 })
    # gravatar_id = Digest::MD5::hexdigest(user.phone.downcase)
    size = options[:size]
    # gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    if user == "1" or user.name == "Class Healing Garden" #healing garden image
      image_tag("http://beta.finegardening.com/app/uploads/sites/finegardening.com/files/images/image-collection/jan4_1.jpg",:size => "150x150", alt: user.name, class: "gravatar")
    elsif user == "2" or user.name == "Class Yoga"
      image_tag("http://cdn2.stylecraze.com/wp-content/uploads/2014/09/2548-5-Effective-Yoga-Poses-To-Increase-Your-Stamina-SS.jpg",:size => "150x150", alt: user.name, class: "gravatar")
    elsif user == "3" or user.name == "Class Curb Diabetes"
      image_tag("https://res-2.cloudinary.com/sharecare/image/upload/c_fill,f_auto,g_faces:center,h_340,w_600/v1484839422/slideshows/healthy-snack-foods-blood-sugar-control-01",:size => "150x150", alt: user.name, class: "gravatar")
    else
      image_tag("https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-256.png",:size => "80x80", alt: user.name, class: "gravatar")
    end
  end
end
