require 'rails_helper'

RSpec.describe "folders/index", type: :view do
  before(:each) do
    assign(:folders, [
      Folder.create!(
        :hash => "Hash",
        :name => "Name",
        :filesize_limit => 1,
        :capacity => 2,
        :duration => ""
      ),
      Folder.create!(
        :hash => "Hash",
        :name => "Name",
        :filesize_limit => 1,
        :capacity => 2,
        :duration => ""
      )
    ])
  end

  it "renders a list of folders" do
    render
    assert_select "tr>td", :text => "Hash".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
