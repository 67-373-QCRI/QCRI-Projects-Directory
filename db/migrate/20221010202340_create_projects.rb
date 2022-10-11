class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.references "team_leader", null: false, foreign_key: {to_table: :researchers}
      t.text "members", array: true, default: []
      t.text "description"
      t.date "start_date", default: Date.current
      t.date "end_date"
      t.timestamps
    end
  end
end
