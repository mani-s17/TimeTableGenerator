json.array!(@standards) do |standard|
  json.extract! standard, :id, :name
  json.url standard_url(standard, format: :json)
end
