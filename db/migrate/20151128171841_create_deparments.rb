class CreateDeparments < ActiveRecord::Migration
  def change
    create_table :deparments do |t|
      t.string :name
      t.string :code

      t.timestamps null: false
    end
  end
end
