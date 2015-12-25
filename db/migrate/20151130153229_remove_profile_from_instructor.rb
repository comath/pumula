class RemoveProfileFromInstructor < ActiveRecord::Migration
  def change
    remove_reference :instructors, :profile, index: true, foreign_key: true
  end
end
