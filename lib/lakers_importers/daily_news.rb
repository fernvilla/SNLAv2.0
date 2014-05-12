require 'feedjira'

class DailyNewsImporter
  def self.import
    source = "Daily News"
    feeds = [
      Feedjira::Feed.fetch_and_parse("http://www.dailynews.com/section?template=RSS&profile=4000078&mime=xml")
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