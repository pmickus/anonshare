require 'rails_helper'

RSpec.describe Content, type: :model do
  it "fails to create when file size is greater than folder limit" do
    folder = create(:folder)
    
    expect(build(:content, folder: folder, 
                           file: File.new(Rails.root + 'spec/fixtures/images/ruby.png'),
                           file_file_size: 6.megabytes, 
                           file_type: 'image')).to_not be_valid 
  end

  it "fails to create when file exceeds folder capacity limit" do
    folder = create(:folder)
    
    expect(build(:content, folder: folder,
                           file: File.new(Rails.root + 'spec/fixtures/images/ruby.png'),
                           file_file_size: 6.gigabytes,
                           file_type: 'image')).to_not be_valid
  end
end
