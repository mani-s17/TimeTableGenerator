json.array!(@teachers) do |teacher|
  json.extract! teacher, :id, :name, :teaching_hours
  json.url teacher_url(teacher, format: :json)
end
