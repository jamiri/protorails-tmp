json.suggestions do
  json.array!(@suggestions) do |suggestion|
    json.id suggestion.id
    json.title suggestion.title
  end
end