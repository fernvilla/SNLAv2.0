class LakersController < ApplicationController
  def index
    @lakers = Laker.where(source: "Official Site").limit_and_order
    @la_times = Laker.where(source: "LA Times").limit_and_order
    @espn = Laker.where(source: "ESPN").limit_and_order
    @oc_register = Laker.where(source: "OC Register").limit_and_order
    @cbs = Laker.where(source: "CBS Los Angeles").limit_and_order
    @bleacher_report = Laker.where(source: "Bleacher Report").limit_and_order
    @fox_sports = Laker.where(source: "FOX Sports").limit_and_order
    @daily_news = Laker.where(source: "Daily News").limit_and_order
    @inside_lakers = Laker.where(source: "Inside The Lakers").limit_and_order

    # Twitter
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_KEY"]
      config.consumer_secret     = ENV["TWITTER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
    @twitter = client.user_timeline('lakers').take(12)
    @kobe = client.user_timeline('kobebryant').take(12)

    # Instagram
    Instagram.configure do |config|
     config.client_id = ENV["INSTAGRAM_KEY"]
     config.client_secret = ENV["INSTAGRAM_SECRET"] 
     config.access_token = ENV["INSTAGRAM_ACCESS_TOKEN"]
    end
    @instagram = Instagram.user_recent_media(16917874)

    respond_to do |format|
      format.html
      # format.json { render json: @lakers.to_json } 
      format.json { render json: Laker.all } 
    end
  end
end
