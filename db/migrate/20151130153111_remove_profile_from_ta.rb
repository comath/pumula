class RemoveProfileFromTa < ActiveRecord::Migration
  def change
    remove_reference :ta, :profile, index: true, foreign_key: true
  end
end
