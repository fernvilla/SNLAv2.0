class ClippersController < ApplicationController
  def index
    @clippers = Clipper.where(source: "Official Site").limit_and_order
    @la_times = Clipper.where(source: "LA Times").limit_and_order
    @espn = Clipper.where(source: "ESPN").limit_and_order
    @oc_register = Clipper.where(source: "OC Register").limit_and_order
    @cbs = Clipper.where(source: "CBS Los Angeles").limit_and_order
    @bleacher_report = Clipper.where(source: "Bleacher Report").limit_and_order
    @fox_sports = Clipper.where(source: "FOX Sports").limit_and_order
    @daily_news = Clipper.where(source: "Daily News").limit_and_order
    @inside_clippers= Clipper.where(source: "Inside The Clippers").limit_and_order

    # Twitter
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_KEY"]
      config.consumer_secret     = ENV["TWITTER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
    @twitter = client.user_timeline('laclippers').take(12)
    @kobe = client.user_timeline('cp3').take(12)

    # Instagram
    Instagram.configure do |config|
     config.client_id = ENV["INSTAGRAM_KEY"]
     config.client_secret = ENV["INSTAGRAM_SECRET"] 
     config.access_token = ENV["INSTAGRAM_ACCESS_TOKEN"]
    end
    @instagram = Instagram.user_recent_media(26987708)

    respond_to do |format|
      format.html
      # format.json { render json: @clippers.to_json } 
      format.json { render json: Clipper.all } 
    end
  end
end
