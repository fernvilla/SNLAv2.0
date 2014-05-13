Dir[File.expand_path('../lakers_importers/*.rb', File.dirname(__FILE__))].each do |file|
  require file
end

namespace :sync do
  desc "Fetch new Lakers stories"
  task :lakers => :environment do
    original_count = Laker.count

    OfficialSiteImporter.import
    LATimesImporter.import
    ESPNImporter.import
    OCRegisterImporter.import
    CBSImporter.import
    BleacherReportImporter.import
    FoxSportsImporter.import
    DailyNewsImporter.import
    InsideLakersImporter.import

    newly_added = Laker.count - original_count
    puts "There are now #{Laker.count} Lakers stories. #{newly_added} were just added."
  end

  desc "Fetch all teams' stories"
  task :all => [:lakers]
end