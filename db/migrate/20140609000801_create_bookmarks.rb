class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.text :title
      t.datetime :published
      t.string :source
      t.string :team
      t.text :url
      t.datetime :date_bookmarked

      t.timestamps
    end
  end
end
