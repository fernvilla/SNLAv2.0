require 'feedjira'

class TrojansFoxSportsImporter
  def self.import
    source = "FOX Sports"
    feeds = [
      Feedjira::Feed.fetch_and_parse("http://feeds.foxsports.com/feedout/syndicatedContent?categoryId=86095"),
      Feedjira::Feed.fetch_and_parse("http://feeds.foxsports.com/feedout/syndicatedContent?categoryId=71635"),
      Feedjira::Feed.fetch_and_parse("http://feeds.foxsports.com/feedout/syndicatedContent?categoryId=1298")
    ]
    
    feeds.each do |feed|
      if defined? feed.entries
        feed.entries.each do |entry|
          Trojan.where(url: entry.url).first_or_create(
            title:      entry.title,
            author:     entry.author,
            summary:    entry.summary,
            url:        entry.url,
            published:  entry.published,
            source:     source,
          )
          if defined? entry.image && !entry.image 
            url = Trojan.where(url: entry.url).first
            url.update(image: entry.image)
          end
        end
      end
    end
  end
end