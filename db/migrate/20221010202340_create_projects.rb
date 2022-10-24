class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.integer "team_leader_id", null: true
      t.string "name"
      t.text "description"
      t.integer "members", array: true, default: []
      t.date "start_date", default: Date.current
      t.date "end_date"
      t.timestamps
    end
  end
end
