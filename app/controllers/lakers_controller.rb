class LakersController < ApplicationController
  def index
    @lakers = Laker.where(source: "Official Site").limit_and_order

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_KEY"]
      config.consumer_secret     = ENV["TWITTER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end

    @twitter = client.user_timeline('lakers').take(10)
  end
end
