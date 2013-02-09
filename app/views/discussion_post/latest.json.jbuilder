json.posts do
  json.array!(@posts) do |post|
    json.id post.id
    json.content post.content
    json.user do
      json.name post.user.name
    end
  end
end