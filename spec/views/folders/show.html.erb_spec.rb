require 'rails_helper'

RSpec.describe "folders/show", type: :view do
  before(:each) do
    @folder = assign(:folder, Folder.create!(
      :hash => "Hash",
      :name => "Name",
      :filesize_limit => 1,
      :capacity => 2,
      :duration => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Hash/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
