include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :content do
    uploaded_by "127.0.0.1"
    file { fixture_file_upload(Rails.root.join('spec/fixtures/ruby.png'), 'image/png') }
  end
end
