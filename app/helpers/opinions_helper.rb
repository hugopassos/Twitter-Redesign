module OpinionsHelper
  def total_tweets(user)
    user.opinions.count
  end
end
