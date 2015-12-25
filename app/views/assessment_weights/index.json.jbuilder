json.array!(@assessment_weights) do |assessment_weight|
  json.extract! assessment_weight, :id
  json.url assessment_weight_url(assessment_weight, format: :json)
end
