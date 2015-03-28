FactoryGirl.define do
  factory :folder do
    name "My Folder"
    filesize_limit 5
    capacity 1
    duration 1
    expires_at Time.now + 1.day
  end
end
