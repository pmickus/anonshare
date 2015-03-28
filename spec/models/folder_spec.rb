require 'rails_helper'

RSpec.describe Folder, type: :model do
  it "generates a token on create" do
    folder = create(:folder)
    expect(folder.token).not_to be_empty
  end
end
