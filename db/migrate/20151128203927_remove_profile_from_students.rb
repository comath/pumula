class RemoveProfileFromStudents < ActiveRecord::Migration
  def change
    remove_reference :students, :profile, index: true, foreign_key: true
  end
end
