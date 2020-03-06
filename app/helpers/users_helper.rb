module UsersHelper
  def show_following
    current_user.followings.count
  end

  def show_followers
    current_user.inverse_followings.count
  end

  def who_to_follow
    current_user.not_followed_users if !current_user.nil?
  end

  def following?(user)
    current_user.followings.exists?(following_id: user.id)
  end

  def following_count(user)
    user.followings.count
  end

  def followers_count(user)
    user.inverse_followings.count
  end

  def followers(user)
    User.followers(user)
  end
end
