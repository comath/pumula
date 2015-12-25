class AddCalculationSchema < ActiveRecord::Migration
  def change
  	create_table :assessment_weights do |t|
      t.text :nature
      t.decimal :weight, precision: 8, scale: 2
      t.timestamps null: false
    end

    rename_table :assignments, :assessments

  end
end
