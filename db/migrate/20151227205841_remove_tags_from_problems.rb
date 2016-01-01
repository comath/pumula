class RemoveTagsFromProblems < ActiveRecord::Migration
  def change
  	remove_column :problems, :tags, :string
  end
end
