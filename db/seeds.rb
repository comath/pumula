# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


tags = %w{differentiation intergration power-rule quotient-rule trigenometric-intergration fields algebra limits limit-sum limit-product}


Course.destroy_all
CourseInstance.destroy_all
Section.destroy_all
Assignment.destroy_all
Problem.destroy_all


tag_list = ""

tags.each{|e| tag_list += " <#{e}>"}

course = Course.create!( name: "Calculus 1", tag_list: tag_list)

course_instance = course.course_instances.create!(semester: "Fall 2016")

sections = course_instance.sections.create!([{name: "01"}, {name: "02"}])

30.times  do |index|
	section = sections.sample
	section.students.create!(name: "Student #{index}")
	end

now = Time.now
ran = Random.new

5.times do |index|
	date = now + ran.rand(1...60)
	course_instance.assignments.create!(due_date: date, nature: "homework", name: "Homework #{index}" )
end

2.times do |index|
	date = now + ran.rand(30...65)
	course_instance.assignments.create!(due_date: date, nature: "exam", name: "Exam #{index}" )
end


homeworks = Assignment.where(nature: "homework")
homeworks.each do |hw|
	5.times do |n| 
		tagsstr = ""
		thesetags = tags.sample(2)
		thesetags.each{ |e| tagsstr += " <#{e}>"}
		hw.problems.create!(name: "Problem #{n}", points: 5, tags: tagsstr) 
	end
	hw.problems.create!(name: "Completion", points: 5, tags: "")
end

exams = Assignment.where(nature: "exam")
exams.each do |exam|
	10.times do |n| 
		tagsstr = ""
		thesetags = tags.sample(2)
		thesetags.each{ |e| tagsstr += " <#{e}>"}
		points = ran.rand(1...4)*5
		exam.problems.create!(name: "Problem #{n}", points: points, tags: tagsstr)
	end
end

Student.all.each do |student|
	Assignment.all.each do |homework|
		curatt = student.student_attempts.create!(assignment_id: homework.id)
		homework.problems.each do |problem|
			max = problem.points
			score = ran.rand(0...max)
			prob_id = problem.id
			curatt.problem_attempts.create!(problem_id: prob_id, score: score)
		end
	end
end
