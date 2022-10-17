class CreatePublications < ActiveRecord::Migration[7.0]
  def change
    create_table :publications do |t|
      t.references :project, foreign_key: true
      t.string "title", null: false
      t.text "authors", array: true, default: []
      t.date "published_on"
      t.boolean "published", default: false
      t.string "doi"
      t.timestamps
    end
  end
end
