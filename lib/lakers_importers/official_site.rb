require 'feedjira'

class OfficialSiteImporter
  def self.import
    source = "Official Site"
    feeds = [
      Feedjira::Feed.fetch_and_parse("http://www.nba.com/lakers/rss.xml"), 
      Feedjira::Feed.fetch_and_parse("http://blog.lakers.com/lakers/feed/"),
    ]
    
    feeds.each do |feed|
      if defined? feed.entries
        feed.entries.each do |entry|
          title = entry.title.gsub(/amp;/, ' ')
          Laker.where(url: entry.url).first_or_create(
            title:      title,
            author:     entry.author,
            summary:    entry.summary,
            url:        entry.url,
            published:  entry.published,
            source:     source,
          )
          if defined? entry.image
            url = Laker.where(url: entry.url).first
            url.update(image: entry.image)
          end
        end
      end
    end
  end
end