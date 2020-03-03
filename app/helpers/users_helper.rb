module UsersHelper
  def show_following
    current_user.followings.count
  end

  def show_followers
    current_user.inverse_followings.count
  end

  def who_to_follow
    User.where.not(id: User.joins(:inverse_followings).where(followings: { user_id: current_user.id })).order(created_at: :desc) if !current_user.nil?
  end

  def following?(user)
    current_user.followings.exists?(following_id: user.id)
  end
end
