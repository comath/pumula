module ApplicationHelper
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  def link_to_incomplete(name, f)
    f.hidden_field(:completion) + link_to_function(name, "incomplete_problem(this)")
  end

  def links_to_new_assessments(course_instance)
    returnlinks = ''
    course_instance.assessment_weights.each do |w|
      returnlinks += '<td class="new_assessment"> '
      returnlinks += link_to('New '+w.name, course_instance_new_weighted_assessment_path(course_instance,w))
      returnlinks +=' </td>'
    end
    returnlinks.html_safe
  end

  def show_and_link_score(course_instance, student, assessment)
    if student.get_latest_attempt(assessment)
      link_to student.get_latest_attempt(assessment).get_total, course_instance_section_student_new_attempt_path(course_instance ,student.section, student, assessment)
    else
      link_to '--', course_instance_section_student_new_attempt_path(course_instance ,student.section, student, assessment)
    end
  end
end

