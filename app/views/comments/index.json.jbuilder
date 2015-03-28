json.array!(@comments) do |comment|
  json.extract! comment, :id, :name, :body, :content
  json.url comment_url(comment, format: :json)
end
