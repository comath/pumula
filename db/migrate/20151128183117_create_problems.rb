class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :name
      t.string :tags
      t.decimal :points
      t.references :assignment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
