class CreateResearchers < ActiveRecord::Migration[7.0]
  def change
    create_table :researchers do |t|
      t.references :user, foreign_key: true
      t.string "group"
      t.string "job_title",
      t.text "bio"
      t.boolean "is_leader", default: false
      t.timestamps
    end
  end
end
