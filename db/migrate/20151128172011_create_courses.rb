class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.references :department, index: true, foreign_key: true
      t.text :tag_list

      t.timestamps null: false
    end
  end
end
