class CreateResearchers < ActiveRecord::Migration[7.0]
  def change
    create_table :researchers do |t|
      t.references :user, foreign_key: true
      t.string "first_name", null: false
      t.string "last_name", null: false
      t.string "group"
      t.string "job_title"
      t.string "phone_number"
      t.string "office_location"
      t.string "github_url"
      t.string "website_url"
      t.text "bio"
      t.boolean "is_leader", default: false
      t.timestamps
    end
  end
end
