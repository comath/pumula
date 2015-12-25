json.array!(@problem_attempts) do |problem_attempt|
  json.extract! problem_attempt, :id
  json.url problem_attempt_url(problem_attempt, format: :json)
end
