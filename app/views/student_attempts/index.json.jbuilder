json.array!(@student_attempts) do |student_attempt|
  json.extract! student_attempt, :id
  json.url student_attempt_url(student_attempt, format: :json)
end
