json.array!(@folders) do |folder|
  json.extract! folder, :id, :hash, :name, :filesize_limit, :capacity, :duration, :expires_at
  json.url folder_url(folder, format: :json)
end
