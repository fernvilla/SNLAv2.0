require 'feedjira'

class OfficialSiteImporter
  def self.import
    source = "Official Site"
    official_feed = Feedjira::Feed.fetch_and_parse("http://www.nba.com/lakers/rss.xml")
    blog_feed = Feedjira::Feed.fetch_and_parse("http://blog.lakers.com/lakers/feed/")

    feeds = [official_feed, blog_feed]
    
    feeds.each do |feed|
      feed.entries.each do |entry|
        Laker.where(url: entry.url).first_or_create(
          title:    entry.title,
          author:   entry.author,
          summary:  entry.summary,
          url:      entry.url,
          # image:    entry.image,
          source:   source
        )
      end
    end
  end
end