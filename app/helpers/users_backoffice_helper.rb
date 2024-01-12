module UsersBackofficeHelper

  def avatar_url
    avatar = current_user.user_profile.avatar
    avatar.attached? ? avatar : 'profile-circle-icon.png'
  end
end
