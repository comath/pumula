class FixAlphabetization < ActiveRecord::Migration
  def change
  	drop_table :tags_courses
  	drop_table :tags_problems
  	    create_table :courses_tags do |t|
    	t.belongs_to :course, index: true
    	t.belongs_to :tag, index: true
    end
    create_table :problems_tags do |t|
    	t.belongs_to :problems, index: true
    	t.belongs_to :tag, index: true
    end
  end
end
