require 'feedjira'

class SparksFoxSportsImporter
  def self.import
    source = "FOX Sports"
    feed = Feedjira::Feed.fetch_and_parse("http://feeds.foxsports.com/feedout/syndicatedContent?categoryId=358")

    if defined? feed.entries
      feed.entries.each do |entry|
        Spark.where(url: entry.url).first_or_create(
          title:      entry.title,
          author:     entry.author,
          summary:    entry.summary,
          url:        entry.url,
          published:  entry.published,
          source:     source,
        )
        if defined? entry.image && !entry.image 
          url = Spark.where(url: entry.url).first
          url.update(image: entry.image)
        end
      end
    end
  end
end