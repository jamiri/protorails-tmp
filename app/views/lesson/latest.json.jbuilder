json.lessons do
  json.array!(@lessons) do |lesson|
    json.id lesson.id
    json.title lesson.title
    json.created_at lesson.created_at.strftime('%d %b %Y')
    json.img_url asset_path(lesson.image_file) if lesson.image_file
    json.audio_url asset_path(lesson.audio_file) if lesson.audio_file
    json.url lesson_path(lesson.slug)
  end
end
