module Session

  def get_user(user_param)
    if User.present?
      User.find_by(provider: user_param[:provider], uid: user_param[:uid]) || User.create_with_provider(user_param)
    else
      User.create_with_provider(user_param)
    end
  end

  def set_access_token(user)
    user.update_attribute :access_token, create_access_token
    user
  end

  private  

  def create_access_token
    Digest::SHA1.hexdigest([Time.now, rand].join)
  end

end
