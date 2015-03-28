json.array!(@contents) do |content|
  json.extract! content, :id, :type, :uploaded_by
  json.url content_url(content, format: :json)
end
