require 'lakers_importers/official_site'

namespace :sync do
  desc "Fetch new Lakers stories"
  task :lakers => :environment do
    original_count = Laker.count

    OfficialSiteImporter.import

    newly_added = Laker.count - original_count
    puts "There are now #{Laker.count} Lakers stories. #{newly_added} were just added."
  end

  desc "Fetch all teams' stories"
  task :all => [:lakers]
end