class RemoveTaToSection < ActiveRecord::Migration
  def change
    remove_reference :sections, :ta, index: true, foreign_key: true
  end
end
