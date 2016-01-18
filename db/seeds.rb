# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

taglist = %w{differentiation intergration power-rule quotient-rule trigenometric-intergration fields algebra limits limit-sum limit-product completion}
taglist.map { |e| {name: e} }

taglist.each do |e|
	Tag.create!(name: e)
end

tags = Tag.all.reject{|e| e.name == 'completion'}

course = Course.create!( name: "Calculus 1", tags: tags)

course_instance = course.course_instances.create!(semester: "Fall 2016")

sections = course_instance.sections.create!([{name: "01"}, {name: "02"}])


names = File.new()
names.each do |name|
	section = sections.sample
	name.to_s
	section.students.create!(name: name)
end


now = Time.now
ran = Random.new

homework = AssessmentWeight.create!(name: 'Homework', weight: 0.30, course_instance: course_instance)
exam = AssessmentWeight.create!(name: 'Exam', weight: 0.70, course_instance: course_instance)


5.times do |index|
	date = now + ran.rand(1...60)
	course_instance.assessments.create!(due_date: date, assessment_weight: homework, name: "Homework #{index}" )
end

2.times do |index|
	date = now + ran.rand(30...65)
	course_instance.assessments.create!(due_date: date, assessment_weight: exam, name: "Exam #{index}" )
end


homeworks = Assessment.where(assessment_weight: homework)
homeworks.each do |hw|
	5.times do |n| 
		thesetags = tags.sample(2)
		problem = hw.problems.create!(name: "Problem #{n}", points: 5)
		problem.tags = thesetags
	end
	prob = hw.problems.create!(name: "Completion", points: 5)
	prob.tags.create!(name: "completion")
end

exams = Assessment.where(assessment_weight: exam)
exams.each do |exam|
	10.times do |n| 
		thesetags = tags.sample(2)
		points = ran.rand(1...4)*5
		problem = exam.problems.create!(name: "Problem #{n}", points: points)
		problem.tags = thesetags
	end
end

Student.all.each do |student|
	Assessment.all.each do |homework|
		curatt = student.student_attempts.create!(assessment_id: homework.id)
		homework.problems.each do |problem|
			max = problem.points
			score = ran.rand(0...max)
			prob_id = problem.id
			curatt.problem_attempts.create!(problem_id: prob_id, score: score)
		end
	end
end
