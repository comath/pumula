class AddTaToSection < ActiveRecord::Migration
  def change
    add_reference :sections, :ta, index: true, foreign_key: true
  end
end
