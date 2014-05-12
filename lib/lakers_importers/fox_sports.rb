require 'feedjira'

class FoxSportsImporter
  def self.import
    source = "FOX Sports"
    feeds = [
      Feedjira::Feed.fetch_and_parse("http://feeds.foxsports.com/feedout/syndicatedContent?categoryId=71087")
    ]
    
    feeds.each do |feed|
      if defined? feed.entries
        feed.entries.each do |entry|
          Laker.where(url: entry.url).first_or_create(
            title:      entry.title,
            author:     entry.author,
            summary:    entry.summary,
            url:        entry.url,
            published:  entry.published,
            source:     source,
          )
          if defined? entry.image
            url = Laker.where(url: entry.url).first
            if !url.image
              url.update(image: entry.image)
            end
          end
        end
      end
    end
  end
end