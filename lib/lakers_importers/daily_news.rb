require 'feedjira'

class LakersDailyNewsImporter
  def self.import
    source = "Daily News"
    feed = Feedjira::Feed.fetch_and_parse("http://www.dailynews.com/section?template=RSS&profile=4000078&mime=xml")

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
        # if defined? entry.image && !entry.image 
        #   url = Laker.where(url: entry.url).first
        #   url.update(image: entry.image)
        # end
      end
    end
  end
end