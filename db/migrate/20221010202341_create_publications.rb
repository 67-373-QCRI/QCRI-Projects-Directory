class CreatePublications < ActiveRecord::Migration[7.0]
  def change
    create_table :publications do |t|
      t.references :project, foreign_key: true
      t.string "title", null: false
      t.text "authors", array: true, default: []
      t.date "published_on"
      t.boolean "published", null: false
      t.string "doi", null: false
      t.timestamps
    end
  end
end
