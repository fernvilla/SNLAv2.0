require 'feedjira'

class GalaxyOfficialSiteImporter
  def self.import
    source = "Official Site"
    feeds = [
      Feedjira::Feed.fetch_and_parse("http://www.lagalaxy.com/rss/en.xml"),
      Feedjira::Feed.fetch_and_parse("http://www.lagalaxy.com/rss/blog/feed.xml")
    ]
    
    feeds.each do |feed|
      if defined? feed.entries
        feed.entries.each do |entry|
          Galaxy.where(url: entry.url).first_or_create(
            title:      entry.title,
            author:     entry.author,
            summary:    entry.summary,
            url:        entry.url,
            published:  entry.published,
            source:     source,
          )
          if defined? entry.image
            url = Galaxy.where(url: entry.url).first
            url.update(image: entry.image)
          end
        end
      end
    end
  end
end