class AddSectionToStudents < ActiveRecord::Migration
  def change
    add_reference :students, :section, index: true, foreign_key: true
  end
end
