require 'feedjira'

class PrepsLATimesImporter
  def self.import
    source = "LA Times"
    feeds = [
      Feedjira::Feed.fetch_and_parse("http://www.latimes.com/sports/highschool/varsity-times/rss2.0.xml"),
      Feedjira::Feed.fetch_and_parse("http://www.latimes.com/sports/highschool/rss2.0.xml")
    ]
    
    feeds.each do |feed|
      if defined? feed.entries
        feed.entries.each do |entry|
          Prep.where(url: entry.url).first_or_create(
            title:      entry.title,
            author:     entry.author,
            summary:    entry.summary,
            url:        entry.url,
            published:  entry.published,
            source:     source,
          )
          if defined? entry.image && !entry.image 
            url = Prep.where(url: entry.url).first
            url.update(image: entry.image)
          end
        end
      end
    end
  end
end