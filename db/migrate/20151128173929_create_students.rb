class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
