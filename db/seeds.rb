# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Course.destroy_all
CourseInstance.destroy_all



course = Course.create!( name: "Calculus 1", tag_list: "<differentiation>, <power-rule>")

course_instance = course.course_instances.create!(semester: "Fall 2016")

section = course_instance.sections.create!()