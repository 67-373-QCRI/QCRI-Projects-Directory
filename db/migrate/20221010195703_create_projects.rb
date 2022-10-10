class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.references :product, foreign_key: true
      t.references :publication, foreign_key: true
      t.string "team_leader", null: false
      t.text "members", array: true, default: []
      t.timestamps
    end
  end
end
