json.questions do
  json.array!(@questions) do |question|
    json.id question.id
    json.question question.question
    json.user do
      json.name question.user.name
    end
  end
end