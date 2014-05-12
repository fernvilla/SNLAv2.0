require 'lakers_importers/official_site'
require 'lakers_importers/la_times'
require 'lakers_importers/espn'
require 'lakers_importers/oc_register'
require 'lakers_importers/cbs'
require 'lakers_importers/bleacher_report'
require 'lakers_importers/fox_sports'
require 'lakers_importers/daily_news'
require 'lakers_importers/inside_lakers'

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