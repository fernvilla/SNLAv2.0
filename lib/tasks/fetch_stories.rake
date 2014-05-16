teams = ['lakers', 'clippers', 'angels', 'dodgers', 'ducks', 'galaxy', 'kings', 'chivas', 'ucla', 'usc', 'sparks', 'preps']

teams.each do |team|
  Dir[File.expand_path("../#{team}_importers/*.rb", File.dirname(__FILE__))].each do |file|
    require file
  end
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

  desc "Fetch new Dodgers stories"
  task :dodgers => :environment do
    original_count = Dodger.count

    DodgersOfficialSiteImporter.import

    newly_added = Dodger.count - original_count
    puts "There are now #{Dodger.count} Dodgers stories. #{newly_added} were just added."
  end

  desc "Fetch new Angels stories"
  task :angels => :environment do
    original_count = Angel.count

    AngelsOfficialSiteImporter.import

    newly_added = Angel.count - original_count
    puts "There are now #{Angel.count} Angels stories. #{newly_added} were just added."
  end

  desc "Fetch new Ducks stories"
  task :ducks => :environment do
    original_count = Duck.count

    DucksOfficialSiteImporter.import

    newly_added = Duck.count - original_count
    puts "There are now #{Duck.count} Ducks stories. #{newly_added} were just added."
  end

  desc "Fetch new Kings stories"
  task :kings => :environment do
    original_count = King.count

    KingsOfficialSiteImporter.import

    newly_added = King.count - original_count
    puts "There are now #{King.count} Kings stories. #{newly_added} were just added."
  end

  desc "Fetch new Bruins stories"
  task :ucla => :environment do
    original_count = Bruin.count

    BruinsOfficialSiteImporter.import

    newly_added = Bruin.count - original_count
    puts "There are now #{Bruin.count} Bruins stories. #{newly_added} were just added."
  end

  desc "Fetch new Trojans stories"
  task :usc => :environment do
    original_count = Trojan.count

    TrojansOfficialSiteImporter.import

    newly_added = Trojan.count - original_count
    puts "There are now #{Trojan.count} Trojans stories. #{newly_added} were just added."
  end

  desc "Fetch new Galaxy stories"
  task :galaxy => :environment do
    original_count = Galaxy.count

    GalaxyOfficialSiteImporter.import

    newly_added = Galaxy.count - original_count
    puts "There are now #{Galaxy.count} Galaxy stories. #{newly_added} were just added."
  end

  desc "Fetch new Chivas stories"
  task :chivas => :environment do
    original_count = Chiva.count

    ChivasOfficialSiteImporter.import

    newly_added = Chiva.count - original_count
    puts "There are now #{Chiva.count} Chivas stories. #{newly_added} were just added."
  end

  desc "Fetch new Sparks stories"
  task :sparks => :environment do
    original_count = Spark.count

    SparksESPNSiteImporter.import

    newly_added = Spark.count - original_count
    puts "There are now #{Spark.count} Sparks stories. #{newly_added} were just added."
  end

  desc "Fetch new Preps stories"
  task :preps => :environment do
    original_count = Prep.count

    PrepsOCRegisterSiteImporter.import

    newly_added = Prep.count - original_count
    puts "There are now #{Prep.count} Preps stories. #{newly_added} were just added."
  end

  desc "Fetch all teams' stories"
  task :all => [:lakers, :clippers, :dodgers, :angels, :kings, :ducks, :galaxy, :chivas, :ucla, :usc, :sparks, :preps]
end