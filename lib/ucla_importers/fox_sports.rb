require 'feedjira'

class BruinsFoxSportsImporter
  def self.import
    source = "FOX Sports"
    feeds = [
      Feedjira::Feed.fetch_and_parse("http://feeds.foxsports.com/feedout/syndicatedContent?categoryId=86094"),
      Feedjira::Feed.fetch_and_parse("http://feeds.foxsports.com/feedout/syndicatedContent?categoryId=71631"),
      Feedjira::Feed.fetch_and_parse("http://feeds.foxsports.com/feedout/syndicatedContent?categoryId=1393")
    ]
    
    feeds.each do |feed|
      if defined? feed.entries
        feed.entries.each do |entry|
          Bruin.where(url: entry.url).first_or_create(
            title:      entry.title,
            author:     entry.author,
            summary:    entry.summary,
            url:        entry.url,
            published:  entry.published,
            source:     source,
          )
          if defined? entry.image && !entry.image 
            url = Bruin.where(url: entry.url).first
            url.update(image: entry.image)
          end
        end
      end
    end
  end
end