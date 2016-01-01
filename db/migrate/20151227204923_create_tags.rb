class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
    	t.string :name
    end
    create_table :tags_courses do |t|
    	t.belongs_to :course, index: true
    	t.belongs_to :tag, index: true
    end
    create_table :tags_problems do |t|
    	t.belongs_to :problems, index: true
    	t.belongs_to :tag, index: true
    end
  end
end
