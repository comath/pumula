class AddSectionToTa < ActiveRecord::Migration
  def change
    add_reference :ta, :section, index: true, foreign_key: true
  end
end
