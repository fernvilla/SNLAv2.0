Dir[File.expand_path('../lakers_importers/*.rb', File.dirname(__FILE__))].each do |file|
  require file
end

Dir[File.expand_path('../clippers_importers/*.rb', File.dirname(__FILE__))].each do |file|
  require file
end

namespace :sync do
  desc "Fetch new Lakers stories"
  task :lakers => :environment do
    original_count = Laker.count

    LakersOfficialSiteImporter.import
    LakersLATimesImporter.import
    LakersESPNImporter.import
    LakersOCRegisterImporter.import
    LakersCBSImporter.import
    LakersBleacherReportImporter.import
    LakersFoxSportsImporter.import
    LakersDailyNewsImporter.import
    InsideLakersImporter.import

    newly_added = Laker.count - original_count
    puts "There are now #{Laker.count} Lakers stories. #{newly_added} were just added."
  end

  desc "Fetch new Clippers stories"
  task :clippers => :environment do
    original_count = Clipper.count

    ClippersOfficialSiteImporter.import
    ClippersLATimesImporter.import
    ClippersESPNImporter.import
    ClippersOCRegisterImporter.import
    ClippersCBSImporter.import
    ClippersBleacherReportImporter.import
    ClippersFoxSportsImporter.import
    ClippersDailyNewsImporter.import
    InsideClippersImporter.import

    newly_added = Clipper.count - original_count
    puts "There are now #{Clipper.count} Clippers stories. #{newly_added} were just added."
  end

  desc "Fetch all teams' stories"
  task :all => [:lakers, :clippers]
end