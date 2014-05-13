class CreateKings < ActiveRecord::Migration
  def change
    create_table :kings do |t|
      t.text :title
      t.string :author
      t.text :summary
      t.datetime :published
      t.string :image
      t.string :source
      t.text :url

      t.timestamps
    end
  end
end
